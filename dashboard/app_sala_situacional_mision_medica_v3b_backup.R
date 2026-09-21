# ================================================================
# SALA SITUACIONAL MISION MEDICA - VERSION ESTRATEGICA V15
# Enfoque:
# - Filtros globales: fecha, departamento, municipio, categoria y subcategoria.
# - Panorama general con departamentos y municipios. Mapa y tendencia en pestañas independientes.
# - Categorias/subcategorias con catalogo oficial y lectura robusta de columna G.
# - Talento humano, servicios afectados, tipo de autor y oportunidad del reporte.
# - Exportacion real de toda la base filtrada mediante boton de descarga.
# - V15: agrega grafica y resumen por institucion reportante/relacionada desde columna AK, excluyendo Sin dato.
# ================================================================

# 1) PAQUETES ---------------------------------------------------------------
paquetes <- c(
  "shiny", "shinydashboard", "readxl", "dplyr", "lubridate",
  "ggplot2", "plotly", "DT", "leaflet", "leaflet.extras", "stringr", "tidyr", "tibble", "writexl", "scales"
)
instalar <- paquetes[!paquetes %in% rownames(installed.packages())]
if (length(instalar) > 0) install.packages(instalar, dependencies = TRUE)

library(shiny)
library(shinydashboard)
library(readxl)
library(dplyr)
library(lubridate)
library(ggplot2)
library(plotly)
library(DT)
library(leaflet)
library(leaflet.extras)
library(stringr)
library(tidyr)
library(tibble)
library(writexl)
library(scales)
library(purrr)
library(DBI)
library(RMariaDB)


# 2) FUNCIONES AUXILIARES ---------------------------------------------------
limpiar_texto <- function(x) {
  x <- as.character(x)
  x <- stringr::str_replace_all(x, "\\r|\\n|\\t", " ")
  x <- stringr::str_squish(x)
  x[is.na(x) | x == "" | x == "NA"] <- "Sin dato"
  x
}

normalizar_texto <- function(x) {
  x <- as.character(x)
  x <- tolower(x)
  x <- iconv(x, from = "UTF-8", to = "ASCII//TRANSLIT")
  x <- stringr::str_replace_all(x, "&", " y ")
  x <- stringr::str_replace_all(x, "[^a-z0-9]+", " ")
  x <- stringr::str_squish(x)
  x[is.na(x)] <- ""
  x
}

parsear_fecha <- function(x) {
  if (inherits(x, "Date")) return(x)
  if (inherits(x, "POSIXct") || inherits(x, "POSIXlt")) return(as.Date(x))
  if (is.numeric(x)) return(suppressWarnings(as.Date(x, origin = "1899-12-30")))
  x_chr <- as.character(x)
  fecha <- suppressWarnings(lubridate::ymd(x_chr))
  faltan <- is.na(fecha)
  fecha[faltan] <- suppressWarnings(lubridate::dmy(x_chr[faltan]))
  faltan <- is.na(fecha)
  fecha[faltan] <- suppressWarnings(lubridate::mdy(x_chr[faltan]))
  as.Date(fecha)
}


leer_base <- function() {
	
con <- dbConnect(
  RMariaDB::MariaDB(),
  host = "192.168.1.3",
  dbname = "bdmisionmedica_dev_copy_2025",
  user = "koyote",
  password = "1q2w3e4R+"
)

sql <- "

SELECT

    i.id,
    DATE(i.incident_date) AS incident_date,
    YEAR(i.incident_date) AS anio,
    MONTH(i.incident_date) AS mes,

    TRIM(l.location_name) AS location_name,
    l.latitude,
    l.longitude,

    TRIM(dep.nombre) AS departamento,
    TRIM(mun.nombre) AS municipio,

    cat.categorias,

    fr.autor,
    fr.afectacion,
    fr.tipo_institucion,
    fr.estado_caso

FROM incident i

LEFT JOIN location l
       ON l.id = i.location_id

/*====================================================
  Categorías
====================================================*/
LEFT JOIN
(
    SELECT

        ic.incident_id,

        GROUP_CONCAT(
            DISTINCT c.category_title
            ORDER BY c.category_title
            SEPARATOR ', '
        ) AS categorias

    FROM incident_category ic

        INNER JOIN category c
            ON c.id = ic.category_id

    GROUP BY ic.incident_id

) cat
ON cat.incident_id=i.id


/*====================================================
  Formulario (UNA SOLA LECTURA)
====================================================*/
LEFT JOIN
(
    SELECT

        incident_id,

        MAX(CASE WHEN form_field_id = 297 THEN form_response END) AS autor,

        MAX(CASE WHEN form_field_id = 313 THEN form_response END) AS afectacion,

        MAX(CASE WHEN form_field_id = 283 THEN form_response END) AS tipo_institucion,

        MAX(CASE WHEN form_field_id = 414 THEN form_response END) AS estado_caso,

        MAX(CASE WHEN form_field_id = 346 THEN form_response END) AS id_departamento,

        MAX(CASE WHEN form_field_id = 347 THEN form_response END) AS id_municipio

    FROM form_response

    GROUP BY incident_id

) fr
ON fr.incident_id=i.id


/*====================================================
  Departamento
====================================================*/
LEFT JOIN departamentos dep
       ON dep.id=fr.id_departamento


/*====================================================
  Municipio
====================================================*/
LEFT JOIN municipios mun
       ON mun.id=fr.id_municipio

ORDER BY i.incident_date DESC

"
  base <- dbGetQuery(con, sql)

  dbDisconnect(con)

  return(base)


}

buscar_columna <- function(base, nombre_preferido, posicion_respaldo) {
  if (nombre_preferido %in% names(base)) return(nombre_preferido)
  if (ncol(base) >= posicion_respaldo) return(names(base)[posicion_respaldo])
  stop(paste("No se encontro la columna", nombre_preferido, "ni la posicion", posicion_respaldo))
}

buscar_columna_patron <- function(base, patrones) {
  nombres_norm <- normalizar_texto(names(base))
  for (pat in patrones) {
    pos <- which(stringr::str_detect(nombres_norm, normalizar_texto(pat)))
    if (length(pos) > 0) return(names(base)[pos[1]])
  }
  NA_character_
}

separar_respuestas_multiples <- function(datos, columna, nombre_variable = "valor") {
  if (is.na(columna) || !(columna %in% names(datos))) {
    return(tibble(id_caso = integer(), !!nombre_variable := character()))
  }
  datos %>%
    select(id_caso, valor_raw = all_of(columna)) %>%
    mutate(valor_raw = limpiar_texto(valor_raw)) %>%
    filter(valor_raw != "Sin dato") %>%
    separate_rows(valor_raw, sep = ",|;|\\|") %>%
    mutate(valor = limpiar_texto(valor_raw)) %>%
    filter(valor != "Sin dato") %>%
    distinct(id_caso, valor) %>%
    rename(!!nombre_variable := valor)
}

# 3) CATALOGO OFICIAL DE CATEGORIAS ----------------------------------------
catalogo_categorias <- tibble::tibble(
  categoria_principal = c(
    rep("Contra la vida y la integridad", 8),
    rep("Contra la infraestructura", 4),
    rep("Contra actividades sanitarias", 6),
    rep("Actos de perfidia", 3),
    rep("Violación al secreto profesional", 3)
  ),
  subcategoria = c(
    "Amenazas",
    "Desaparición forzada",
    "Desplazamiento forzado",
    "Homicidio",
    "Lesiones personales",
    "Secuestro y toma de rehenes",
    "Tortura",
    "Acoso y abuso sexual",
    "Ataques contra medios de transporte sanitario",
    "Ataques contra unidades sanitarias",
    "Utilización de los medios de transporte sanitarios",
    "Utilización de los medios de las unidades sanitarias",
    "Control o restricción del tránsito de medicamentos o equipos",
    "Hurto de medicamentos y/o equipos",
    "Restricción o prohibición de la oferta de servicios de salud",
    "Forzar la atención en salud en condiciones inadecuadas",
    "Irrespeto a las prioridades médicas",
    "Obstaculización de la atención de heridos o enfermos",
    "A condición de persona protegida",
    "Una incapacidad por heridas o enfermedad",
    "La tenencia de un estatuto de protección",
    "Obligar a las personas que ejerzan una actividad médica",
    "Sancionar a las personas que ejerzan una actividad médica",
    "Sancionar la revelación lícita de información médica"
  )
) %>%
  mutate(

  categoria_norm = normalizar_texto(categoria_principal),

  subcategoria_norm = normalizar_texto(subcategoria),

  etiqueta_norm = normalizar_texto(
      paste(categoria_principal, subcategoria, sep=" - ")
  ),

  patron_categoria = paste0("\\b",categoria_norm,"\\b"),

  patron_subcategoria = paste0("\\b",subcategoria_norm,"\\b"),

  patron_etiqueta = paste0("\\b",etiqueta_norm,"\\b")

)

clasificar_categorias_evento <- function(base, columna_categoria){

    textos <- base %>%

        transmute(

            id_caso,

            categoria_raw = limpiar_texto(.data[[columna_categoria]]),

            categoria_norm = normalizar_texto(categoria_raw)

        )



    clasificada <-

        purrr::map2_dfr(

            seq_len(nrow(catalogo_categorias)),

            split(catalogo_categorias,
                  seq_len(nrow(catalogo_categorias))),

            function(i,cat){

                textos %>%

                    filter(

                        str_detect(categoria_norm,
                                   cat$patron_etiqueta) |

                        (
                            str_detect(categoria_norm,
                                       cat$patron_categoria)

                            &

                            str_detect(categoria_norm,
                                       cat$patron_subcategoria)
                        )

                        |

                        str_detect(categoria_norm,
                                   cat$patron_subcategoria)

                    ) %>%

                    transmute(

                        id_caso,

                        categoria_principal = cat$categoria_principal,

                        subcategoria = cat$subcategoria,

                        categoria_raw,

                        match_catalogo = TRUE

                    )

            }

        )



    clasificada <- distinct(clasificada)



    no_clasificada <-

        textos %>%

        filter(

            categoria_norm!="",

            categoria_norm!="sin dato"

        ) %>%

        anti_join(

            clasificada %>%

                distinct(id_caso),

            by="id_caso"

        ) %>%

        transmute(

            id_caso,

            categoria_principal="Sin clasificar",

            subcategoria=categoria_raw,

            categoria_raw,

            match_catalogo=FALSE

        )



    bind_rows(

        clasificada,

        no_clasificada

    )

}

# 4) LECTURA Y PREPARACION --------------------------------------------------

base_original <- leer_base()

base <- base_original %>%
  rename(
    id_caso          = id,
    fecha_incidente  = incident_date,
    categoria_texto_original = categorias,
    tipo_autor       = autor,
    departamento     = departamento,
    municipio        = municipio,
    latitud          = latitude,
    longitud         = longitude
  ) %>%
  mutate(

    fecha_incidente = parsear_fecha(fecha_incidente),

    fecha_reporte = as.Date(NA),

    dias_oportunidad = NA_real_,

    categoria_texto_original = limpiar_texto(categoria_texto_original),

    departamento = limpiar_texto(departamento),

    municipio = limpiar_texto(municipio),

    afectacion = limpiar_texto(afectacion),

    tipo_autor = limpiar_texto(tipo_autor),

    estado_caso = limpiar_texto(estado_caso),

    tipo_institucion = limpiar_texto(tipo_institucion),

    institucion = "Sin dato",

    talento_humano = "Sin dato",

    sexo = "Sin dato",

    servicio_afectado = "Sin dato",

    interrupcion_servicio = "Sin dato",

    latitud = suppressWarnings(as.numeric(latitud)),

    longitud = suppressWarnings(as.numeric(longitud)),

    anio = if ("anio" %in% names(.)) anio else lubridate::year(fecha_incidente),

    mes = if ("mes" %in% names(.))
      as.Date(sprintf("%04d-%02d-01", anio, mes))
    else
      lubridate::floor_date(fecha_incidente, "month"),

    semana = lubridate::floor_date(
      fecha_incidente,
      "week",
      week_start = 1
    )

  ) %>%
  filter(!is.na(fecha_incidente))


#=========================================================
# Clasificación oficial de categorías
#=========================================================

base_categorias <-
  clasificar_categorias_evento(
    base,
    "categoria_texto_original"
  )


#=========================================================
# Variables multirespuesta
#=========================================================

base_talento <-
  separar_respuestas_multiples(
    base,
    "talento_humano",
    "talento_humano"
  )

base_servicios <-
  separar_respuestas_multiples(
    base,
    "servicio_afectado",
    "servicio_afectado"
  )


#=========================================================
# Paleta institucional categorías
#=========================================================

paleta_categorias <- c(
  "Contra la vida y la integridad"        = "#1F77B4",
  "Contra actividades sanitarias"         = "#FF7F0E",
  "Contra la infraestructura"             = "#2CA02C",
  "Violación al secreto profesional"      = "#D62728",
  "Actos de perfidia"                     = "#9467BD",
  "Sin clasificar"                        = "#8C564B"
)


#=========================================================
# Paleta multicolor
#=========================================================

paleta_multicolor <- c(
  "#C00000",
  "#E65100",
  "#F9A825",
  "#43A047",
  "#1E88E5",
  "#5E35B1",
  "#8E24AA",
  "#00897B",
  "#6D4C41",
  "#546E7A",
  "#D81B60",
  "#00ACC1",
  "#7CB342",
  "#FB8C00",
  "#3949AB"
)


#=========================================================
# Paleta instituciones
#=========================================================

paleta_institucion_ak <- c(
  "#006D77",
  "#83C5BE",
  "#FFDDD2",
  "#E29578",
  "#6A4C93",
  "#1982C4",
  "#8AC926",
  "#FFCA3A",
  "#FF595E",
  "#2A9D8F",
  "#E76F51",
  "#264653",
  "#A7C957",
  "#BC4749",
  "#3A86FF"
)


#=========================================================
# Rango de fechas
#=========================================================

fecha_min <- min(base$fecha_incidente, na.rm = TRUE)

fecha_max <- max(base$fecha_incidente, na.rm = TRUE)

# 5) INTERFAZ ---------------------------------------------------------------

ui <- dashboardPage(

  skin = "blue",

  dashboardHeader(

    title = tags$a(
      href = "http://devmisionmedica.sytes.net",
      target = "_blank",
      style = "color:white; text-decoration:none;",
      icon("hospital"),
      " Sala Situacional Estratégica - Misión Médica"
    ),

    titleWidth = 420

  ),

  dashboardSidebar(

    width = 360,

    sidebarMenu(

      dateRangeInput(
        "rango_fechas",
        "Periodo de análisis",
        start = fecha_min,
        end = fecha_max,
        min = fecha_min,
        max = fecha_max,
        format = "yyyy-mm-dd",
        language = "es",
        separator = " a "
      ),

      selectInput(
        "departamento",
        "Departamento",
        choices = NULL,
        selected = "Todos"
      ),

      selectInput(
        "municipio",
        "Municipio",
        choices = "Todos",
        selected = "Todos"
      ),

      hr(),

      selectInput(
        "categoria_principal",
        "Categoría principal",
        choices = NULL,
        selected = "Todas"
      ),

      selectInput(
        "subcategoria",
        "Subcategoría",
        choices = "Todas",
        selected = "Todas"
      ),

      hr(),

      selectInput(
        "afectacion",
        "Afectación específica",
        choices = NULL,
        selected = "Todos"
      ),

      selectInput(
        "autor",
        "Presunto autor",
        choices = NULL,
        selected = "Todos"
      ),

      selectInput(
        "estado",
        "Estado actual del caso",
        choices = NULL,
        selected = "Todos"
      ),

      hr(),

      actionButton(
        "limpiar",
        "Limpiar filtros",
        icon = icon("eraser"),
        width = "100%"
      )

    )

  ),

  dashboardBody(

    tags$head(

      tags$style(HTML("

        .content-wrapper,
        .right-side{
            background:#f4f6f9;
        }

        .box{
            border-radius:10px;
        }

        .small-box{
            border-radius:10px;
        }

        .main-header .logo{
            font-weight:bold;
        }

        .dataTables_wrapper{
            font-size:12px;
        }

        .box-body{
            padding:16px;
        }

        .shiny-download-link{
            margin-bottom:12px;
        }

        .plotly.html-widget{
            width:100%!important;
        }

        .tab-content{
            padding-top:10px;
        }

      "))

    ),

    fluidRow(

      valueBoxOutput("kpi_total", width = 3),
      valueBoxOutput("kpi_deptos", width = 3),
      valueBoxOutput("kpi_mpios", width = 3),
      valueBoxOutput("kpi_incidencias", width = 3)

    ),

    tabBox(

      width = 12,

      title = "Sala Situacional Estratégica",

      id = "tabs",

      ##########################################################
      # Panorama
      ##########################################################

      tabPanel(
        "Panorama general",

        fluidRow(
          box(
            width = 12,
            title = "Casos por departamento",
            status = "primary",
            solidHeader = TRUE,
            plotlyOutput("graf_departamento", height = 760)
          )
        ),

        fluidRow(
          box(
            width = 12,
            title = "Casos por municipio",
            status = "primary",
            solidHeader = TRUE,
            plotlyOutput("graf_municipio", height = 1100)
          )
        ),

        fluidRow(
          box(
            width = 12,
            title = "Ranking departamento / municipio",
            status = "info",
            solidHeader = TRUE,
            DTOutput("tabla_territorial")
          )
        )

      ),

      ##########################################################
      # Categorías
      ##########################################################

      tabPanel(
        "Categorías y tipologías",

        fluidRow(
          box(
            width = 12,
            title = "Categoría principal",
            status = "primary",
            solidHeader = TRUE,
            plotlyOutput("graf_categoria_principal", height = 720)
          )
        ),

        fluidRow(
          box(
            width = 12,
            title = "Participación porcentual por categoría",
            status = "primary",
            solidHeader = TRUE,
            plotlyOutput("graf_categoria_donut", height = 720)
          )
        ),

        fluidRow(
          box(
            width = 12,
            title = "Resumen por categoría",
            status = "info",
            solidHeader = TRUE,
            DTOutput("tabla_resumen_categoria")
          )
        ),

        fluidRow(
          box(
            width = 12,
            title = "Tipologías",
            status = "primary",
            solidHeader = TRUE,
            plotlyOutput("graf_subcategoria", height = 900)
          )
        ),

        fluidRow(
          box(
            width = 12,
            title = "Resumen de tipologías",
            status = "info",
            solidHeader = TRUE,
            DTOutput("tabla_resumen_subcategoria")
          )
        ),

        fluidRow(
          box(
            width = 12,
            title = "Matriz categoría / tipología",
            status = "info",
            solidHeader = TRUE,
            DTOutput("tabla_categoria_subcategoria")
          )
        ),

        fluidRow(
          box(
            width = 12,
            title = "Registros sin clasificar",
            status = "warning",
            solidHeader = TRUE,
            DTOutput("tabla_no_clasificados")
          )
        )

      ),

      ##########################################################
      # Talento Humano
      ##########################################################

      tabPanel(
        "Talento humano y servicios",

        fluidRow(
          box(width=12,title="Talento humano afectado",status="primary",solidHeader=TRUE,
              plotlyOutput("graf_talento",height=760))
        ),

        fluidRow(
          box(width=12,title="Distribución por sexo",status="primary",solidHeader=TRUE,
              plotlyOutput("graf_sexo",height=620))
        ),

        fluidRow(
          box(width=12,title="Resumen sexo",status="info",solidHeader=TRUE,
              DTOutput("tabla_resumen_sexo"))
        ),

        fluidRow(
          box(width=12,title="Servicios afectados",status="info",solidHeader=TRUE,
              plotlyOutput("graf_servicios",height=760))
        ),

        fluidRow(
          box(width=12,title="Interrupción del servicio",status="info",solidHeader=TRUE,
              plotlyOutput("graf_interrupcion",height=620))
        ),

        fluidRow(
          box(width=12,title="Resumen interrupción",status="info",solidHeader=TRUE,
              DTOutput("tabla_resumen_interrupcion"))
        )

      ),

      ##########################################################
      # Autor
      ##########################################################

      tabPanel(
        "Presunto autor",

        fluidRow(
          box(width=12,title="Eventos por presunto autor",status="primary",solidHeader=TRUE,
              plotlyOutput("graf_autor",height=760))
        ),

        fluidRow(
          box(width=12,title="Participación porcentual",status="primary",solidHeader=TRUE,
              plotlyOutput("graf_autor_torta",height=620))
        ),

        fluidRow(
          box(width=12,title="Resumen",status="info",solidHeader=TRUE,
              DTOutput("tabla_resumen_autor"))
        )

      ),

      ##########################################################
      # Reporte
      ##########################################################

      tabPanel(
        "Oportunidad del reporte",

        fluidRow(
          valueBoxOutput("kpi_promedio_reporte",4),
          valueBoxOutput("kpi_mediana_reporte",4),
          valueBoxOutput("kpi_24h",4)
        ),

        fluidRow(
          box(width=12,title="Clasificación",status="primary",solidHeader=TRUE,
              plotlyOutput("graf_oportunidad_clase",height=620))
        ),

        fluidRow(
          box(width=12,title="Distribución de días",status="info",solidHeader=TRUE,
              plotlyOutput("graf_oportunidad",height=720))
        )

      ),

      ##########################################################
      # Complementaria
      ##########################################################

      tabPanel(
        "Caracterización complementaria",

        fluidRow(
          box(width=12,title="Afectación específica",status="primary",solidHeader=TRUE,
              plotlyOutput("graf_afectacion",height=720))
        ),

        fluidRow(
          box(width=12,title="Estado actual del caso",status="info",solidHeader=TRUE,
              plotlyOutput("graf_estado",height=620))
        ),

        fluidRow(
          box(width=12,title="Tipo de institución",status="info",solidHeader=TRUE,
              plotlyOutput("graf_institucion",height=700))
        ),

        fluidRow(
          box(width=12,title="Institución afectada",status="primary",solidHeader=TRUE,
              plotlyOutput("graf_institucion_ak",height=760))
        ),

        fluidRow(
          box(width=12,title="Resumen institución afectada",status="info",solidHeader=TRUE,
              DTOutput("tabla_resumen_institucion_ak"))
        )

      ),

      ##########################################################
      # Exportación
      ##########################################################

      tabPanel(
        "Exportación",

        fluidRow(
          box(
            width=12,
            title="Exportar información filtrada",
            status="primary",
            solidHeader=TRUE,

            downloadButton(
              "descargar_excel",
              "Descargar Excel"
            ),

            downloadButton(
              "descargar_csv",
              "Descargar CSV"
            ),

            br(),br(),

            DTOutput("tabla_base")

          )
        )

      ),

      ##########################################################
      # Mapa
      ##########################################################

      tabPanel(
        "Mapa de eventos",

        fluidRow(
          box(
            width=12,
            title="Mapa geográfico de eventos",
            status="info",
            solidHeader=TRUE,
            leafletOutput("mapa",height=900)
          )
        )

      )

    )

  )

)
# 6) SERVIDOR ---------------------------------------------------------------


#------------------------------------------------------------------
# Opciones iniciales de filtros
#------------------------------------------------------------------

opciones_departamento <- c(
  "Todos",
  sort(unique(base$departamento))
)

opciones_categoria <- c(
  "Todas",
  sort(unique(catalogo_categorias$categoria_principal)),
  "Sin clasificar"
)

opciones_afectacion <- c(
  "Todos",
  sort(unique(base$afectacion[base$afectacion != "Sin dato"]))
)

opciones_autor <- c(
  "Todos",
  sort(unique(base$tipo_autor[base$tipo_autor != "Sin dato"]))
)

opciones_estado <- c(
  "Todos",
  sort(unique(base$estado_caso[base$estado_caso != "Sin dato"]))
)
server <- function(input, output, session) {
 observe({

  updateSelectInput(
    session,
    "departamento",
    choices = opciones_departamento,
    selected = "Todos"
  )

  updateSelectInput(
    session,
    "categoria_principal",
    choices = opciones_categoria,
    selected = "Todas"
  )

  updateSelectInput(
    session,
    "afectacion",
    choices = opciones_afectacion,
    selected = "Todos"
  )

  updateSelectInput(
    session,
    "autor",
    choices = opciones_autor,
    selected = "Todos"
  )

  updateSelectInput(
    session,
    "estado",
    choices = opciones_estado,
    selected = "Todos"
  )

})
  #------------------------------------------------------------------
# Actualización dinámica de municipios
#------------------------------------------------------------------
observeEvent(input$departamento, {

  municipios <- base %>%
    filter(
      input$departamento == "Todos" |
        departamento == input$departamento
    ) %>%
    pull(municipio) %>%
    unique() %>%
    sort()

  updateSelectInput(
    session,
    "municipio",
    choices = c("Todos", municipios),
    selected = "Todos"
  )

}, ignoreInit = FALSE)


#------------------------------------------------------------------
# Actualización dinámica de subcategorías
#------------------------------------------------------------------
observeEvent(input$categoria_principal, {

  opciones <- dplyr::case_when(

    is.null(input$categoria_principal) ~
      sort(unique(catalogo_categorias$subcategoria)),

    input$categoria_principal == "Todas" ~
      sort(unique(catalogo_categorias$subcategoria)),

    input$categoria_principal == "Sin clasificar" ~
      sort(unique(
        base_categorias$subcategoria[
          base_categorias$categoria_principal == "Sin clasificar"
        ]
      )),

    TRUE ~
      catalogo_categorias %>%
      filter(categoria_principal == input$categoria_principal) %>%
      pull(subcategoria) %>%
      sort()

  )

  updateSelectInput(
    session,
    "subcategoria",
    choices = c("Todas", opciones),
    selected = "Todas"
  )

}, ignoreInit = FALSE)


#------------------------------------------------------------------
# Restablecer filtros
#------------------------------------------------------------------
observeEvent(input$limpiar, {

  updateDateRangeInput(
    session,
    "rango_fechas",
    start = fecha_min,
    end = fecha_max
  )

  updateSelectInput(session, "departamento", selected = "Todos")
  updateSelectInput(session, "municipio", selected = "Todos")
  updateSelectInput(session, "categoria_principal", selected = "Todas")
  updateSelectInput(session, "subcategoria", selected = "Todas")
  updateSelectInput(session, "afectacion", selected = "Todos")
  updateSelectInput(session, "autor", selected = "Todos")
  updateSelectInput(session, "estado", selected = "Todos")

})


#------------------------------------------------------------------
# IDs que cumplen el filtro de categorías
#------------------------------------------------------------------
ids_por_filtro_categoria <- reactive({

  ids <- base$id_caso

  if (input$categoria_principal != "Todas") {

    ids <- intersect(
      ids,
      base_categorias %>%
        filter(categoria_principal == input$categoria_principal) %>%
        pull(id_caso) %>%
        unique()
    )

  }

  if (input$subcategoria != "Todas") {

    ids <- intersect(
      ids,
      base_categorias %>%
        filter(subcategoria == input$subcategoria) %>%
        pull(id_caso) %>%
        unique()
    )

  }

  ids

})


#------------------------------------------------------------------
# Base filtrada principal
#------------------------------------------------------------------
datos_filtrados <- reactive({

  req(input$rango_fechas)

  base %>%
    filter(

      fecha_incidente >= input$rango_fechas[1],

      fecha_incidente <= input$rango_fechas[2],

      id_caso %in% ids_por_filtro_categoria(),

      input$departamento == "Todos" |
        departamento == input$departamento,

      input$municipio == "Todos" |
        municipio == input$municipio,

      input$afectacion == "Todos" |
        afectacion == input$afectacion,

      input$autor == "Todos" |
        tipo_autor == input$autor,

      input$estado == "Todos" |
        estado_caso == input$estado

    )

})


#------------------------------------------------------------------
# Categorías filtradas
#------------------------------------------------------------------
categorias_filtradas <- reactive({

  base_categorias %>%
    filter(id_caso %in% datos_filtrados()$id_caso) %>%
    filter(
      input$categoria_principal == "Todas" |
        categoria_principal == input$categoria_principal
    ) %>%
    filter(
      input$subcategoria == "Todas" |
        subcategoria == input$subcategoria
    )

})


#------------------------------------------------------------------
# Bases auxiliares
#------------------------------------------------------------------
talento_filtrado <- reactive({

  base_talento %>%
    filter(id_caso %in% datos_filtrados()$id_caso)

})

servicios_filtrados <- reactive({

  base_servicios %>%
    filter(id_caso %in% datos_filtrados()$id_caso)

})


#------------------------------------------------------------------
# Base para exportación
#------------------------------------------------------------------
base_exportar <- reactive({

  resumen_cat <-

    base_categorias %>%
    group_by(id_caso) %>%
    summarise(

      categorias_principales =
        paste(unique(categoria_principal), collapse = "; "),

      subcategorias =
        paste(unique(subcategoria), collapse = "; "),

      .groups = "drop"

    )

  datos_filtrados() %>%

    left_join(resumen_cat, by = "id_caso") %>%

    select(

      fecha_incidente,
      fecha_reporte,
      dias_oportunidad,

      departamento,
      municipio,

      categorias_principales,
      subcategorias,
      categoria_texto_original,

      afectacion,
      tipo_autor,
      estado_caso,

      tipo_institucion,
      institucion,

      talento_humano,
      sexo,

      servicio_afectado,
      interrupcion_servicio,

      everything()

    )

})


#------------------------------------------------------------------
# KPIs
#------------------------------------------------------------------
output$kpi_total <- renderValueBox({

  valueBox(
    format(nrow(datos_filtrados()), big.mark = "."),
    "Total de casos",
    icon = icon("database"),
    color = "blue"
  )

})

output$kpi_deptos <- renderValueBox({

  valueBox(
    n_distinct(datos_filtrados()$departamento),
    "Departamentos",
    icon = icon("map"),
    color = "aqua"
  )

})

output$kpi_mpios <- renderValueBox({

  valueBox(
    n_distinct(datos_filtrados()$municipio),
    "Municipios",
    icon = icon("location-dot"),
    color = "green"
  )

})

output$kpi_incidencias <- renderValueBox({

  valueBox(
    format(nrow(categorias_filtradas()), big.mark = "."),
    "Incidencias categoría/subcategoría",
    icon = icon("layer-group"),
    color = "yellow"
  )

})

  output$kpi_promedio_reporte <- renderValueBox({
    d <- datos_filtrados()$dias_oportunidad
    d <- d[!is.na(d) & d >= 0]
    valor <- if (length(d) == 0) "Sin dato" else round(mean(d), 1)
    valueBox(valor, "Promedio días reporte", icon = icon("clock"), color = "blue")
  })
  output$kpi_mediana_reporte <- renderValueBox({
    d <- datos_filtrados()$dias_oportunidad
    d <- d[!is.na(d) & d >= 0]
    valor <- if (length(d) == 0) "Sin dato" else round(median(d), 1)
    valueBox(valor, "Mediana días reporte", icon = icon("stopwatch"), color = "aqua")
  })
  output$kpi_24h <- renderValueBox({
    d <- datos_filtrados()$dias_oportunidad
    d <- d[!is.na(d) & d >= 0]
    valor <- if (length(d) == 0) "Sin dato" else paste0(round(mean(d <= 1) * 100, 1), "%")
    valueBox(valor, "Reportados en 24 horas", icon = icon("bolt"), color = "green")
  })
  
  graf_barras <- function(datos, variable, etiqueta = "", top_n = 30, alto_margen = 260, ylab = "Número de casos", paleta = c("#D7ECFF", "#005B96"), colores_fijos = NULL) {
    if (nrow(datos) == 0 || !(variable %in% names(datos))) {
      return(plotly_empty(type = "scatter", mode = "markers") %>% layout(title = "Sin datos para los filtros seleccionados"))
    }
    tabla <- datos %>%
      count(.data[[variable]], name = "casos", sort = TRUE) %>%
      slice_head(n = top_n)
    names(tabla)[1] <- "variable"
    tabla$variable <- as.character(tabla$variable)
    tabla <- tabla %>% arrange(casos)
    max_casos <- max(tabla$casos, na.rm = TRUE)
    if (!is.null(colores_fijos)) {
      colores <- unname(colores_fijos[tabla$variable])
      colores[is.na(colores)] <- "#7F7F7F"
      marker_cfg <- list(color = colores, line = list(color = "rgba(255,255,255,0.9)", width = 1))
    } else {
      marker_cfg <- list(color = tabla$casos, colorscale = list(c(0, paleta[1]), c(1, paleta[2])), showscale = FALSE, line = list(color = "rgba(255,255,255,0.9)", width = 1))
    }
    plot_ly(
      data = tabla,
      x = ~casos,
      y = ~factor(variable, levels = variable),
      type = "bar",
      orientation = "h",
      text = ~casos,
      textposition = "outside",
      textfont = list(size = 13, color = "#1F2937"),
      cliponaxis = FALSE,
      marker = marker_cfg,
      hovertemplate = paste0("%{y}<br>", ylab, ": %{x}<extra></extra>")
    ) %>%
      layout(
        xaxis = list(title = ylab, range = c(0, max_casos * 1.35), zeroline = FALSE),
        yaxis = list(title = etiqueta, automargin = TRUE, tickfont = list(size = 12)),
        margin = list(l = alto_margen, r = 170, b = 75, t = 35),
        bargap = 0.25
      )
  }
  

  etiqueta_multilinea_categoria <- function(x) {
    dplyr::case_when(
      x == "Contra la vida y la integridad" ~ "Contra la vida<br>y la integridad",
      x == "Contra actividades sanitarias" ~ "Contra actividades<br>sanitarias",
      x == "Contra la infraestructura" ~ "Contra la<br>infraestructura",
      x == "Violación al secreto profesional" ~ "Violación al<br>secreto profesional",
      x == "Actos de perfidia" ~ "Actos de<br>perfidia",
      x == "Sin clasificar" ~ "Sin<br>clasificar",
      TRUE ~ stringr::str_replace_all(x, " ", "<br>")
    )
  }
  
  resumen_categoria <- reactive({
    datos <- categorias_filtradas()
    if (nrow(datos) == 0) {
      return(tibble::tibble(categoria_principal = character(), incidencias = numeric(), porcentaje = numeric(), etiqueta_x = character(), etiqueta_valor = character()))
    }
    datos %>%
      count(categoria_principal, name = "incidencias", sort = TRUE) %>%
      mutate(
        porcentaje = incidencias / sum(incidencias),
        etiqueta_x = etiqueta_multilinea_categoria(categoria_principal),
        etiqueta_valor = paste0(format(incidencias, big.mark = "."), "<br>", scales::percent(porcentaje, accuracy = 0.1)),
        categoria_principal = factor(categoria_principal, levels = categoria_principal),
        etiqueta_x = factor(etiqueta_x, levels = etiqueta_x)
      )
  })
  
  graf_categoria_vertical <- function() {
    tabla <- resumen_categoria()
    if (nrow(tabla) == 0) {
      return(plotly_empty(type = "scatter", mode = "markers") %>% layout(title = "Sin datos para los filtros seleccionados"))
    }
    colores <- unname(paleta_categorias[as.character(tabla$categoria_principal)])
    colores[is.na(colores)] <- "#7F7F7F"
    max_y <- max(tabla$incidencias, na.rm = TRUE)
    plot_ly(
      data = tabla,
      x = ~etiqueta_x,
      y = ~incidencias,
      type = "bar",
      text = ~etiqueta_valor,
      textposition = "outside",
      textfont = list(size = 15, color = "#111827", family = "Arial"),
      cliponaxis = FALSE,
      marker = list(color = colores, line = list(color = "rgba(255,255,255,0.95)", width = 1.2)),
      hovertemplate = paste0(
        "%{customdata}<br>",
        "Incidencias: %{y}<br>",
        "Participación: %{text}<extra></extra>"
      ),
      customdata = ~as.character(categoria_principal)
    ) %>%
      layout(
        xaxis = list(
          title = "",
          tickfont = list(size = 13),
          automargin = TRUE,
          categoryorder = "array",
          categoryarray = as.character(tabla$etiqueta_x)
        ),
        yaxis = list(title = "Incidencias", range = c(0, max_y * 1.25), zeroline = FALSE),
        margin = list(l = 80, r = 70, b = 120, t = 30),
        bargap = 0.38,
        showlegend = FALSE
      )
  }
  
  etiqueta_multilinea_general <- function(x, max_words_line = 2) {
    x <- as.character(x)
    vapply(x, function(z) {
      z <- stringr::str_squish(z)
      if (is.na(z) || z == "") return("Sin<br>dato")
      palabras <- unlist(strsplit(z, "\\s+"))
      if (length(palabras) <= max_words_line) return(paste(palabras, collapse = " "))
      grupos <- split(palabras, ceiling(seq_along(palabras) / max_words_line))
      paste(vapply(grupos, paste, collapse = " ", FUN.VALUE = character(1)), collapse = "<br>")
    }, FUN.VALUE = character(1))
  }

  graf_barras_vertical <- function(datos, variable, etiqueta = "", top_n = 12, ylab = "Número de casos", paleta = c("#D7ECFF", "#005B96"), colores_discretos = NULL) {
    if (nrow(datos) == 0 || !(variable %in% names(datos))) {
      return(plotly_empty(type = "scatter", mode = "markers") %>% layout(title = "Sin datos para los filtros seleccionados"))
    }
    tabla <- datos %>%
      count(.data[[variable]], name = "casos", sort = TRUE) %>%
      slice_head(n = top_n)
    names(tabla)[1] <- "variable"
    tabla$variable <- as.character(tabla$variable)
    tabla <- tabla %>%
      mutate(
        porcentaje = casos / sum(casos),
        etiqueta_x = etiqueta_multilinea_general(variable, max_words_line = 2),
        etiqueta_valor = paste0(format(casos, big.mark = "."), "<br>", scales::percent(porcentaje, accuracy = 0.1))
      ) %>%
      arrange(desc(casos))
    tabla$etiqueta_x <- factor(tabla$etiqueta_x, levels = tabla$etiqueta_x)
    max_y <- max(tabla$casos, na.rm = TRUE)
    plot_ly(
      data = tabla,
      x = ~etiqueta_x,
      y = ~casos,
      type = "bar",
      text = ~etiqueta_valor,
      textposition = "outside",
      textfont = list(size = 13, color = "#111827"),
      cliponaxis = FALSE,
      marker = if (!is.null(colores_discretos)) {
        list(
          color = rep(colores_discretos, length.out = nrow(tabla)),
          line = list(color = "rgba(255,255,255,0.95)", width = 1.1)
        )
      } else {
        list(
          color = ~casos,
          colorscale = list(c(0, paleta[1]), c(1, paleta[2])),
          showscale = FALSE,
          line = list(color = "rgba(255,255,255,0.95)", width = 1.1)
        )
      },
      hovertemplate = paste0("%{customdata}<br>", ylab, ": %{y}<br>Participación: %{text}<extra></extra>"),
      customdata = ~variable
    ) %>%
      layout(
        xaxis = list(title = "", tickfont = list(size = 12), automargin = TRUE, categoryorder = "array", categoryarray = as.character(tabla$etiqueta_x)),
        yaxis = list(title = ylab, range = c(0, max_y * 1.28), zeroline = FALSE),
        margin = list(l = 80, r = 90, b = 150, t = 35),
        bargap = 0.35,
        showlegend = FALSE
      )
  }

  graf_participacion <- function(datos, variable, etiqueta = "", paleta = c("#E0F3DB", "#0868AC")) {
    if (nrow(datos) == 0 || !(variable %in% names(datos))) {
      return(plotly_empty(type = "scatter", mode = "markers") %>% layout(title = "Sin datos"))
    }
    tabla <- datos %>% count(.data[[variable]], name = "n", sort = TRUE)
    names(tabla)[1] <- "variable"
    tabla <- tabla %>%
      mutate(
        pct = n / sum(n),
        etiqueta_valor = paste0(n, " casos - ", scales::percent(pct, accuracy = 0.1))
      ) %>%
      arrange(pct)
    max_pct <- max(tabla$pct, na.rm = TRUE)
    plot_ly(
      data = tabla,
      x = ~pct,
      y = ~factor(variable, levels = variable),
      type = "bar",
      orientation = "h",
      text = ~etiqueta_valor,
      textposition = "outside",
      textfont = list(size = 14, color = "#1F2937"),
      marker = list(
        color = ~pct,
        colorscale = list(c(0, paleta[1]), c(1, paleta[2])),
        showscale = FALSE
      ),
      hovertemplate = "%{y}<br>Participación: %{x:.1%}<extra></extra>"
    ) %>%
      layout(
        title = etiqueta,
        xaxis = list(title = "Participación", tickformat = ".0%", range = c(0, max_pct * 1.35), zeroline = FALSE),
        yaxis = list(title = "", automargin = TRUE),
        margin = list(l = 300, r = 180, b = 70, t = 50),
        bargap = 0.30
      )
  }
  
  graf_torta <- function(datos, variable, titulo = "", colores_fijos = NULL) {
    if (nrow(datos) == 0 || !(variable %in% names(datos))) {
      return(plotly_empty(type = "scatter", mode = "markers") %>% layout(title = "Sin datos"))
    }
    tabla <- datos %>%
      count(.data[[variable]], name = "n", sort = TRUE) %>%
      filter(!is.na(.data[[variable]]))
    names(tabla)[1] <- "variable"
    if (nrow(tabla) == 0 || sum(tabla$n, na.rm = TRUE) == 0) {
      return(plotly_empty(type = "scatter", mode = "markers") %>% layout(title = "Sin datos"))
    }
    tabla <- tabla %>%
      mutate(
        pct = n / sum(n),
        etiqueta = paste0(variable, "<br>", n, " casos<br>", scales::percent(pct, accuracy = 0.1))
      )
    colores <- NULL
    if (!is.null(colores_fijos)) {
      colores <- unname(colores_fijos[tabla$variable])
      colores[is.na(colores)] <- "#7F7F7F"
    }
    plot_ly(
      data = tabla,
      labels = ~variable,
      values = ~n,
      type = "pie",
      text = ~etiqueta,
      textinfo = "percent",
      textposition = "inside",
      insidetextorientation = "radial",
      marker = if (!is.null(colores)) list(colors = colores) else list(),
      hovertemplate = "%{label}<br>Casos: %{value}<br>Participación: %{percent}<extra></extra>"
    ) %>%
      layout(
        title = titulo,
        showlegend = TRUE,
        legend = list(orientation = "v", x = 1.02, y = 0.5),
        margin = list(l = 60, r = 260, b = 60, t = 80)
      )
  }
  
  graf_donut <- function(datos, variable, etiqueta = "", colores_fijos = NULL) {
    graf_torta(datos, variable, etiqueta, colores_fijos)
  }
  
  # Excluir valores vacíos / Sin dato solo para análisis porcentuales donde el campo no aplica a todos los casos.
  # Esto evita que "Sin dato" distorsione la torta y que el porcentaje se calcule sobre registros no aplicables.
  datos_registrados <- function(datos, variable) {
    if (nrow(datos) == 0 || !(variable %in% names(datos))) return(datos[0, , drop = FALSE])
    datos %>%
      mutate(.valor_tmp = limpiar_texto(.data[[variable]])) %>%
      filter(!is.na(.valor_tmp), .valor_tmp != "", .valor_tmp != "Sin dato") %>%
      select(-.valor_tmp)
  }
  
  output$graf_departamento <- renderPlotly({ graf_barras(datos_filtrados(), "departamento", "Departamento", 40, 220, "Número de casos", c("#FFE0B2", "#E65100")) })
  output$graf_municipio <- renderPlotly({ 
    graf_barras(datos_filtrados(), "municipio", "Municipio", 50, 420, "Número de casos", c("#D9F0A3", "#006D2C")) 
  })
  output$graf_categoria_principal <- renderPlotly({ 
    graf_categoria_vertical()
  })
  output$graf_subcategoria <- renderPlotly({ graf_barras(categorias_filtradas(), "subcategoria", "Subcategoría", 40, 390, "Incidencias", c("#FFF7BC", "#D95F0E")) })
  output$graf_categoria_donut <- renderPlotly({ 
    graf_donut(categorias_filtradas(), "categoria_principal", "Participación por categoría", colores_fijos = paleta_categorias) 
  })
  output$graf_talento <- renderPlotly({ 
    graf_barras_vertical(
      talento_filtrado(), "talento_humano", "Talento humano", 15, "Incidencias",
      colores_discretos = paleta_multicolor
    ) 
  })
  output$graf_sexo <- renderPlotly({ 
    graf_donut(datos_registrados(datos_filtrados(), "sexo"), "sexo", "Distribución por sexo/género - solo registros con dato") 
  })
  output$graf_servicios <- renderPlotly({ 
    graf_barras_vertical(
      servicios_filtrados(), "servicio_afectado", "Servicio afectado", 15, "Incidencias",
      colores_discretos = paleta_multicolor
    ) 
  })
  output$graf_interrupcion <- renderPlotly({ 
    graf_donut(datos_registrados(datos_filtrados(), "interrupcion_servicio"), "interrupcion_servicio", "Interrupción del servicio - solo registros con dato") 
  })
  output$graf_autor <- renderPlotly({ 
    graf_barras_vertical(
      datos_registrados(datos_filtrados(), "tipo_autor"), "tipo_autor", "Tipo de autor", 15, "Número de casos",
      colores_discretos = paleta_multicolor
    ) 
  })
  output$graf_autor_torta <- renderPlotly({
    graf_donut(datos_registrados(datos_filtrados(), "tipo_autor"), "tipo_autor", "Participación por tipo de autor - solo registros con dato")
  })
  output$graf_afectacion <- renderPlotly({
    graf_barras_vertical(
      datos_registrados(datos_filtrados(), "afectacion"),
      "afectacion", "Afectación", 12, "Número de casos",
      colores_discretos = paleta_multicolor
    )
  })
  output$graf_estado <- renderPlotly({ graf_barras_vertical(datos_filtrados(), "estado_caso", "Estado", 12, "Número de casos", c("#E5E5E5", "#525252")) })
  output$graf_institucion <- renderPlotly({
    graf_barras_vertical(
      datos_registrados(datos_filtrados(), "tipo_institucion"),
      "tipo_institucion", "Tipo de institución", 12, "Número de casos",
      colores_discretos = paleta_multicolor
    )
  })

  output$graf_institucion_ak <- renderPlotly({
    graf_barras_vertical(
      datos_registrados(datos_filtrados(), "institucion"),
      "institucion", "Institución", 15, "Número de casos",
      colores_discretos = paleta_institucion_ak
    )
  })
  
  output$graf_tiempo <- renderPlotly({
    tabla <- datos_filtrados() %>% count(mes, name = "casos") %>% arrange(mes)
    if (nrow(tabla) == 0) return(ggplotly(ggplot() + annotate("text", x = 1, y = 1, label = "Sin datos") + theme_void()))
    gg <- ggplot(tabla, aes(x = mes, y = casos, text = paste0("Mes: ", mes, "<br>Casos: ", casos))) +
      geom_col(aes(fill = casos), width = 20) +
      geom_line(linewidth = 1.1, color = "#003F5C") +
      geom_point(size = 2.8, color = "#003F5C") +
      geom_text(aes(label = casos), vjust = -0.35, size = 4, fontface = "bold") +
      scale_fill_gradient(low = "#B9DDF1", high = "#004E89") +
      scale_y_continuous(expand = expansion(mult = c(0, 0.18))) +
      labs(x = "Mes", y = "Número de casos") +
      theme_minimal(base_size = 13) + theme(legend.position = "none")
    ggplotly(gg, tooltip = "text")
  })
  
  output$graf_oportunidad <- renderPlotly({
    datos <- datos_filtrados() %>% filter(!is.na(dias_oportunidad), dias_oportunidad >= 0)
    if (nrow(datos) == 0) return(plotly_empty(type = "scatter", mode = "markers") %>% layout(title = "No se detectó columna de fecha de reporte o no hay datos válidos"))
    datos <- datos %>%
      mutate(rango_dias = case_when(
        dias_oportunidad == 0 ~ "0 días",
        dias_oportunidad == 1 ~ "1 día",
        dias_oportunidad == 2 ~ "2 días",
        dias_oportunidad == 3 ~ "3 días",
        dias_oportunidad == 4 ~ "4 días",
        dias_oportunidad == 5 ~ "5 días",
        dias_oportunidad == 6 ~ "6 días",
        dias_oportunidad == 7 ~ "7 días",
        dias_oportunidad <= 15 ~ "8 a 15 días",
        dias_oportunidad <= 30 ~ "16 a 30 días",
        dias_oportunidad <= 60 ~ "31 a 60 días",
        dias_oportunidad <= 90 ~ "61 a 90 días",
        TRUE ~ "Más de 90 días"
      ))
    niveles <- c("0 días", "1 día", "2 días", "3 días", "4 días", "5 días", "6 días", "7 días", "8 a 15 días", "16 a 30 días", "31 a 60 días", "61 a 90 días", "Más de 90 días")
    tabla <- datos %>% count(rango_dias, name = "reportes") %>% mutate(rango_dias = factor(rango_dias, levels = niveles)) %>% arrange(rango_dias)
    max_rep <- max(tabla$reportes, na.rm = TRUE)
    plot_ly(tabla, x = ~rango_dias, y = ~reportes, type = "bar",
            text = ~reportes, textposition = "outside",
            marker = list(color = ~reportes, colorscale = list(c(0, "#D9F0A3"), c(1, "#238443")), showscale = FALSE),
            hovertemplate = "Rango: %{x}<br>Reportes: %{y}<extra></extra>") %>%
      layout(xaxis = list(title = "Días transcurridos agrupados"),
             yaxis = list(title = "Reportes", range = c(0, max_rep * 1.22)),
             margin = list(l = 80, r = 90, b = 100, t = 35), bargap = 0.25)
  })
  
  output$graf_oportunidad_clase <- renderPlotly({
    datos <- datos_filtrados() %>% filter(!is.na(dias_oportunidad), dias_oportunidad >= 0) %>%
      mutate(clase_oportunidad = case_when(
        dias_oportunidad <= 1 ~ "0 a 1 día",
        dias_oportunidad <= 7 ~ "2 a 7 días",
        dias_oportunidad <= 30 ~ "8 a 30 días",
        TRUE ~ "Más de 30 días"
      ))
    graf_torta(datos, "clase_oportunidad", "Participación por oportunidad del reporte")
  })
  
  opciones_dt <- function(page_length = 25) {
    list(pageLength = page_length, lengthMenu = list(c(10, 25, 50, 100, -1), c("10", "25", "50", "100", "Todos")),
         dom = "Blfrtip", buttons = list(
           list(extend = "copy", exportOptions = list(modifier = list(page = "all", search = "applied"))),
           list(extend = "csv", exportOptions = list(modifier = list(page = "all", search = "applied"))),
           list(extend = "excel", exportOptions = list(modifier = list(page = "all", search = "applied")))
         ), language = list(url = "//cdn.datatables.net/plug-ins/1.10.11/i18n/Spanish.json"), scrollX = TRUE)
  }
  
  output$tabla_territorial <- renderDT({ datos_filtrados() %>% count(departamento, municipio, name = "casos", sort = TRUE) %>% datatable(rownames = FALSE, extensions = c("Buttons"), options = opciones_dt(25)) }, server = FALSE)
  output$tabla_resumen_categoria <- renderDT({
    tabla <- resumen_categoria() %>%
      mutate(
        categoria_principal = as.character(categoria_principal),
        porcentaje = scales::percent(porcentaje, accuracy = 0.1)
      ) %>%
      select(`Categoría principal` = categoria_principal, Incidencias = incidencias, Participación = porcentaje)
    total <- tibble::tibble(`Categoría principal` = "TOTAL", Incidencias = sum(tabla$Incidencias, na.rm = TRUE), Participación = "100.0%")
    tabla <- bind_rows(tabla, total)
    datatable(tabla, rownames = FALSE, options = list(pageLength = 10, dom = "t", ordering = FALSE, scrollX = TRUE), class = "compact stripe") %>%
      formatStyle("Categoría principal", fontWeight = styleEqual("TOTAL", "bold")) %>%
      formatStyle("Incidencias", fontWeight = styleEqual(sum(tabla$Incidencias[tabla$`Categoría principal` != "TOTAL"], na.rm = TRUE), "bold"))
  }, server = FALSE)
  
  output$tabla_resumen_subcategoria <- renderDT({
    tabla <- categorias_filtradas() %>%
      count(categoria_principal, subcategoria, name = "incidencias", sort = TRUE)
    if (nrow(tabla) > 0) {
      tabla <- tabla %>%
        mutate(
          porcentaje = scales::percent(incidencias / sum(incidencias), accuracy = 0.1)
        ) %>%
        select(`Categoría principal` = categoria_principal, `Tipología / subcategoría` = subcategoria, Incidencias = incidencias, Participación = porcentaje)
      total <- tibble::tibble(`Categoría principal` = "TOTAL", `Tipología / subcategoría` = "", Incidencias = sum(tabla$Incidencias), Participación = "100.0%")
      tabla <- bind_rows(tabla, total)
    }
    datatable(tabla, rownames = FALSE, extensions = c("Buttons"), options = opciones_dt(50))
  }, server = FALSE)

  output$tabla_categoria_subcategoria <- renderDT({ categorias_filtradas() %>% count(categoria_principal, subcategoria, name = "incidencias", sort = TRUE) %>% datatable(rownames = FALSE, extensions = c("Buttons"), options = opciones_dt(25)) }, server = FALSE)
  output$tabla_no_clasificados <- renderDT({ categorias_filtradas() %>% filter(match_catalogo == FALSE) %>% count(categoria_raw, name = "registros", sort = TRUE) %>% datatable(rownames = FALSE, extensions = c("Buttons"), options = opciones_dt(25)) }, server = FALSE)

  tabla_resumen_variable <- function(datos, variable, nombre_variable = "Variable") {
    datos_validos <- datos_registrados(datos, variable)
    if (nrow(datos_validos) == 0 || !(variable %in% names(datos_validos))) {
      return(tibble::tibble(!!nombre_variable := character(), Casos = integer(), Participación = character()))
    }
    tabla <- datos_validos %>%
      count(.data[[variable]], name = "Casos", sort = TRUE)
    names(tabla)[1] <- nombre_variable
    tabla <- tabla %>%
      mutate(Participación = scales::percent(Casos / sum(Casos), accuracy = 0.1))
    total <- tibble::tibble(!!nombre_variable := "TOTAL", Casos = sum(tabla$Casos), Participación = "100.0%")
    bind_rows(tabla, total)
  }

  output$tabla_resumen_sexo <- renderDT({
    datatable(tabla_resumen_variable(datos_filtrados(), "sexo", "Sexo/género"),
              rownames = FALSE, options = list(pageLength = 10, dom = "t", ordering = FALSE, scrollX = TRUE),
              class = "compact stripe") %>%
      formatStyle("Sexo/género", fontWeight = styleEqual("TOTAL", "bold"))
  }, server = FALSE)

  output$tabla_resumen_interrupcion <- renderDT({
    datatable(tabla_resumen_variable(datos_filtrados(), "interrupcion_servicio", "Interrupción del servicio"),
              rownames = FALSE, options = list(pageLength = 10, dom = "t", ordering = FALSE, scrollX = TRUE),
              class = "compact stripe") %>%
      formatStyle("Interrupción del servicio", fontWeight = styleEqual("TOTAL", "bold"))
  }, server = FALSE)

  output$tabla_resumen_autor <- renderDT({
    datatable(tabla_resumen_variable(datos_filtrados(), "tipo_autor", "Tipo de autor"),
              rownames = FALSE, options = list(pageLength = 15, dom = "t", ordering = FALSE, scrollX = TRUE),
              class = "compact stripe") %>%
      formatStyle("Tipo de autor", fontWeight = styleEqual("TOTAL", "bold"))
  }, server = FALSE)

  output$tabla_autor <- renderDT({ datos_registrados(datos_filtrados(), "tipo_autor") %>% count(tipo_autor, name = "casos", sort = TRUE) %>% mutate(porcentaje = scales::percent(casos / sum(casos), accuracy = 0.1)) %>% datatable(rownames = FALSE, extensions = c("Buttons"), options = opciones_dt(25)) }, server = FALSE)

  output$tabla_resumen_institucion_ak <- renderDT({
    datatable(tabla_resumen_variable(datos_filtrados(), "institucion", "Institución"),
              rownames = FALSE, extensions = c("Buttons"),
              options = list(pageLength = 20, dom = "Btip", buttons = list("copy", "csv", "excel"), ordering = FALSE, scrollX = TRUE),
              class = "compact stripe") %>%
      formatStyle("Institución", fontWeight = styleEqual("TOTAL", "bold"))
  }, server = FALSE)
  
  output$tabla_base <- renderDT({
    datatable(base_exportar(), rownames = FALSE, filter = "top", extensions = c("Buttons"),
              options = list(pageLength = 25, lengthMenu = list(c(25, 50, 100, -1), c("25", "50", "100", "Todos")),
                             dom = "Blfrtip", buttons = list("copy", "csv", "excel"),
                             language = list(url = "//cdn.datatables.net/plug-ins/1.10.11/i18n/Spanish.json"),
                             scrollX = TRUE, scrollY = "700px"))
  }, server = FALSE)
  
  output$tabla_columnas <- renderDT({
    tibble::tibble(
      variable = c("Fecha incidente", "Fecha reporte", "Categoría", "Departamento", "Municipio", "Afectación", "Tipo de autor", "Estado", "Tipo de institución", "Institución AK", "Talento humano", "Sexo/género", "Servicios", "Interrupción", "Latitud", "Longitud"),
      columna_detectada = c(col_fecha, col_fecha_reporte, col_categoria, col_departamento, col_municipio, col_afectacion, col_autor, col_estado, col_institucion, col_institucion_ak, col_talento, col_sexo, col_servicio, col_interrupcion, col_lat, col_lon)
    ) %>% datatable(rownames = FALSE, options = list(pageLength = 20, scrollX = TRUE))
  })
  
  output$descargar_excel <- downloadHandler(
    filename = function() paste0("base_filtrada_mision_medica_", Sys.Date(), ".xlsx"),
    content = function(file) writexl::write_xlsx(base_exportar(), path = file)
  )
  output$descargar_csv <- downloadHandler(
    filename = function() paste0("base_filtrada_mision_medica_", Sys.Date(), ".csv"),
    content = function(file) write.csv(base_exportar(), file, row.names = FALSE, fileEncoding = "UTF-8")
  )
  
  output$mapa <- renderLeaflet({
    puntos <- datos_filtrados() %>%
      filter(!is.na(latitud), !is.na(longitud), latitud != 0, longitud != 0) %>%
      group_by(departamento, municipio, latitud, longitud) %>%
      summarise(casos = n(), .groups = "drop")
    
    mapa_base <- leaflet() %>% addProviderTiles(providers$CartoDB.Positron)
    
    if (nrow(puntos) == 0) {
      mapa_base %>% setView(lng = -74.2973, lat = 4.5709, zoom = 5)
    } else {
      pal <- colorNumeric(palette = "YlOrRd", domain = puntos$casos)
      mapa_base %>%
        addHeatmap(
          data = puntos,
          lng = ~longitud,
          lat = ~latitud,
          intensity = ~casos,
          blur = 28,
          max = max(puntos$casos, na.rm = TRUE),
          radius = 22
        ) %>%
        addCircleMarkers(
          data = puntos,
          lng = ~longitud,
          lat = ~latitud,
          radius = ~pmax(6, sqrt(casos) * 4),
          stroke = TRUE,
          weight = 1.5,
          color = "#7F2704",
          fillColor = ~pal(casos),
          fillOpacity = 0.82,
          popup = ~paste0(
            "<b>Departamento:</b> ", departamento,
            "<br><b>Municipio:</b> ", municipio,
            "<br><b>Casos:</b> ", casos
          )
        ) %>%
        addLegend("bottomright", pal = pal, values = puntos$casos, title = "Casos") %>%
        fitBounds(
          lng1 = min(puntos$longitud), lat1 = min(puntos$latitud),
          lng2 = max(puntos$longitud), lat2 = max(puntos$latitud)
        )
    }
  })

}

# 7) EJECUTAR ---------------------------------------------------------------
#shinyApp(ui = ui, server = server)
options(shiny.host = "0.0.0.0")
options(shiny.port = 5535)

shinyApp(ui = ui, server = server)
