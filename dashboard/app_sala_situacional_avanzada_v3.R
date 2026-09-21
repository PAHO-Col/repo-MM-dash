# ================================================================
# SALA SITUACIONAL AVANZADA - MISION MEDICA
# Version corregida para categorias principales y subcategorias
# Punto de partida: analisis territorial por departamento/municipio y fechas
# Base esperada en la misma carpeta del app: mm2026mayo.xlsx o mm2026mayo.csv
# ================================================================

# 1) INSTALAR PAQUETES AUTOMATICAMENTE SI HACEN FALTA -------------------------
paquetes <- c(
  "shiny", "shinydashboard", "readxl", "dplyr", "lubridate",
  "ggplot2", "plotly", "DT", "leaflet", "stringr", "tidyr", "tibble",
"DBI","RMariaDB"
)
instalar <- paquetes[!paquetes %in% rownames(installed.packages())]
if (length(instalar) > 0) install.packages(instalar, dependencies = TRUE)

# 2) CARGAR LIBRERIAS ---------------------------------------------------------
library(shiny)
library(shinydashboard)
library(readxl)
library(dplyr)
library(lubridate)
library(ggplot2)
library(plotly)
library(DT)
library(leaflet)
library(stringr)
library(tidyr)
library(DBI)
library(RMariaDB)

# 3) FUNCIONES AUXILIARES -----------------------------------------------------
limpiar_texto <- function(x) {
  x <- as.character(x)
  x <- stringr::str_squish(x)
  x[x == "" | is.na(x)] <- "Sin dato"
  x
}

normalizar_texto <- function(x) {
  x <- as.character(x)
  x <- tolower(x)
  x <- iconv(x, from = "UTF-8", to = "ASCII//TRANSLIT")
  x <- gsub("[^a-z0-9]+", " ", x)
  x <- stringr::str_squish(x)
  x
}

parsear_fecha <- function(x) {
  if (inherits(x, "Date")) return(x)
  if (inherits(x, "POSIXct") || inherits(x, "POSIXlt")) return(as.Date(x))
  x_chr <- as.character(x)
  fecha <- suppressWarnings(lubridate::ymd(x_chr))
  faltan <- is.na(fecha)
  fecha[faltan] <- suppressWarnings(lubridate::dmy(x_chr[faltan]))
  faltan <- is.na(fecha)
  fecha[faltan] <- suppressWarnings(lubridate::mdy(x_chr[faltan]))
  as.Date(fecha)
}


con <- dbConnect(
  RMariaDB::MariaDB(),
  host = "192.168.1.3",
  dbname = "bdmisionmedica_dev_copy_2025",
  user = "koyote",
  password = "1q2w3e4R+"
)

leer_base <- function() {

sql <- "
SELECT
	i.id,
	i.incident_date,
	l.location_name,
	l.latitude,
	l.longitude,

	d.nombre AS departamento,
	m.nombre AS municipio,

	cat.categorias,

	autor.autor,

	estado.estado_caso,

	af.afectacion,

	inst.tipo_institucion

FROM incident i
LEFT JOIN location l
ON i.location_id=l.id

LEFT JOIN
(
	SELECT
		fr.incident_id,
	GROUP_CONCAT(c.category_title SEPARATOR ', ') categorias
	FROM incident_category ic
	INNER JOIN category c
	ON c.id=ic.category_id
	INNER JOIN form_response fr
	ON fr.incident_id=ic.incident_id
	GROUP BY fr.incident_id
) cat
ON cat.incident_id=i.id

LEFT JOIN
(
	SELECT
	incident_id,
	MAX(form_response) autor
	FROM form_response
	WHERE form_field_id=297
	GROUP BY incident_id
) autor
ON autor.incident_id=i.id

LEFT JOIN
(
	SELECT
	incident_id,
	MAX(form_response) afectacion
	FROM form_response
	WHERE form_field_id=313
	GROUP BY incident_id
) af
ON af.incident_id=i.id

LEFT JOIN
(
	SELECT
	incident_id,
	MAX(form_response) tipo_institucion
	FROM form_response
	WHERE form_field_id=283
	GROUP BY incident_id
) inst
ON inst.incident_id=i.id

LEFT JOIN
(
	SELECT
	incident_id,
	MAX(form_response) estado_caso
	FROM form_response
	WHERE form_field_id=414
	GROUP BY incident_id
) estado
ON estado.incident_id=i.id

LEFT JOIN
(
	SELECT
	fr.incident_id,
	dep.nombre
	FROM form_response fr
	INNER JOIN departamentos dep
	ON dep.id=fr.form_response
	WHERE fr.form_field_id=346
) d
ON d.incident_id=i.id

LEFT JOIN
(
	SELECT
	fr.incident_id,
	mun.nombre
	FROM form_response fr
	INNER JOIN municipios mun
	ON mun.id=fr.form_response
	WHERE fr.form_field_id=347
) m
ON m.incident_id=i.id

"

base <- dbGetQuery(con, sql)

return(base)

}


# 4) CATALOGO OFICIAL DE CATEGORIAS Y SUBCATEGORIAS --------------------------
# IMPORTANTE:
# En la columna CATEGORY de la BD los datos vienen asi:
# "Categoria principal - Subcategoria,Categoria principal - Subcategoria"
# Por eso NO se debe comparar solo contra la subcategoria.
# Se compara contra la etiqueta completa y tambien se deja una alternativa por subcategoria.

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
    etiqueta_completa = paste(categoria_principal, subcategoria, sep = " - "),
    etiqueta_norm = normalizar_texto(etiqueta_completa),
    categoria_norm = normalizar_texto(categoria_principal),
    subcategoria_norm = normalizar_texto(subcategoria)
  )

# Funcion: toma el texto de columna G, separa por comas y cruza contra el catalogo oficial.
# Un mismo caso puede quedar relacionado con varias subcategorias/incidencias.
# Para contar CASOS, se usa distinct(id_caso). Para contar INCIDENCIAS, se cuentan las filas clasificadas.
clasificar_categorias_evento <- function(base, columna_categoria) {
  if (!columna_categoria %in% names(base)) {
    return(tibble::tibble(
      id_caso = integer(),
      categoria_principal = character(),
      subcategoria = character(),
      subcategoria_raw = character(),
      match_catalogo = logical()
    ))
  }
  
  tmp <- base %>%
    transmute(
      id_caso = id_caso,
      categoria_raw = limpiar_texto(.data[[columna_categoria]])
    ) %>%
    tidyr::separate_rows(categoria_raw, sep = ",") %>%
    mutate(
      etiqueta_raw = stringr::str_squish(categoria_raw),
      etiqueta_norm = normalizar_texto(etiqueta_raw),
      # Extrae lo que esta despues del guion, por si se necesita como respaldo.
      subcategoria_raw = stringr::str_squish(ifelse(stringr::str_detect(etiqueta_raw, " - "),
                                                    stringr::str_replace(etiqueta_raw, "^.*?\\s-\\s", ""),
                                                    etiqueta_raw)),
      subcategoria_norm = normalizar_texto(subcategoria_raw)
    ) %>%
    filter(!is.na(etiqueta_norm), etiqueta_norm != "", etiqueta_norm != "sin dato")
  
  # Cruce principal: etiqueta completa "Categoria - Subcategoria".
  clasificada_1 <- tmp %>%
    left_join(
      catalogo_categorias %>% select(categoria_principal, subcategoria, etiqueta_norm),
      by = "etiqueta_norm"
    )
  
  # Cruce de respaldo: si alguna fila no empata, intenta por subcategoria normalizada.
  # Esto sirve si en futuras BD solo dejan la subcategoria sin el prefijo de categoria.
  pendientes <- clasificada_1 %>% filter(is.na(categoria_principal)) %>% select(id_caso, etiqueta_raw, etiqueta_norm, subcategoria_raw, subcategoria_norm)
  clasificada_2 <- pendientes %>%
    left_join(
      catalogo_categorias %>% select(categoria_principal, subcategoria, subcategoria_norm),
      by = "subcategoria_norm"
    )
  
  clasificada <- bind_rows(
    clasificada_1 %>% filter(!is.na(categoria_principal)) %>% select(id_caso, categoria_principal, subcategoria, subcategoria_raw, etiqueta_raw),
    clasificada_2 %>% filter(!is.na(categoria_principal)) %>% select(id_caso, categoria_principal, subcategoria, subcategoria_raw, etiqueta_raw)
  ) %>%
    mutate(match_catalogo = TRUE) %>%
    distinct(id_caso, categoria_principal, subcategoria, subcategoria_raw, etiqueta_raw, match_catalogo)
  
  no_clasificada <- tmp %>%
    anti_join(clasificada %>% select(id_caso, etiqueta_raw), by = c("id_caso", "etiqueta_raw")) %>%
    transmute(
      id_caso,
      categoria_principal = "Sin clasificar",
      subcategoria = subcategoria_raw,
      subcategoria_raw = etiqueta_raw,
      etiqueta_raw = etiqueta_raw,
      match_catalogo = FALSE
    )
  
  bind_rows(clasificada, no_clasificada) %>%
    distinct(id_caso, categoria_principal, subcategoria, subcategoria_raw, etiqueta_raw, match_catalogo)
}

# 5) LEER BASE Y DEFINIR COLUMNAS CLAVE --------------------------------------

base_original <- leer_base()

# Se usan los nombres reales de la BD entregada.
col_fecha        <- "incident_date"       # Columna D
col_categoria    <- "categorias"           # Columna G
col_departamento <- "departamento"      # Columna S
col_municipio    <- "municipio"         # Columna T
col_afectacion   <- "afectacion"
col_autor        <- "autor"
col_estado       <- "estado_caso"
col_institucion  <- "tipo_institucion"
col_lat          <- "latitude"
col_lon          <- "longitude"

columnas_requeridas <- c(col_fecha, col_departamento, col_municipio, col_categoria)
faltantes <- setdiff(columnas_requeridas, names(base_original))
if (length(faltantes) > 0) {
  stop(paste("Faltan columnas requeridas en la base:", paste(faltantes, collapse = ", ")))
}

# 6) PREPARAR BASE ------------------------------------------------------------
base_original <- leer_base()
base <- base_original %>%
  mutate(
    id_caso = dplyr::row_number(),
    fecha_incidente = parsear_fecha(.data[[col_fecha]]),
    categoria_texto_original = limpiar_texto(.data[[col_categoria]]),
    departamento = limpiar_texto(.data[[col_departamento]]),
    municipio = limpiar_texto(.data[[col_municipio]]),
    afectacion = if (col_afectacion %in% names(.)) limpiar_texto(.data[[col_afectacion]]) else "Sin dato",
    tipo_autor = if (col_autor %in% names(.)) limpiar_texto(.data[[col_autor]]) else "Sin dato",
    estado_caso = if (col_estado %in% names(.)) limpiar_texto(.data[[col_estado]]) else "Sin dato",
    tipo_institucion = if (col_institucion %in% names(.)) limpiar_texto(.data[[col_institucion]]) else "Sin dato",
    latitud = if (col_lat %in% names(.)) suppressWarnings(as.numeric(.data[[col_lat]])) else NA_real_,
    longitud = if (col_lon %in% names(.)) suppressWarnings(as.numeric(.data[[col_lon]])) else NA_real_,
    anio = year(fecha_incidente),
    mes = floor_date(fecha_incidente, "month"),
    semana = floor_date(fecha_incidente, "week", week_start = 1)
  ) %>%
  filter(!is.na(fecha_incidente))

base_categorias <- clasificar_categorias_evento(base, col_categoria)

fecha_min <- min(base$fecha_incidente, na.rm = TRUE)
fecha_max <- max(base$fecha_incidente, na.rm = TRUE)

# 7) INTERFAZ DE USUARIO ------------------------------------------------------
ui <- dashboardPage(
  skin = "blue",
  dashboardHeader(title = "Sala Situacional - Mision Medica", titleWidth = 350),
  dashboardSidebar(
    width = 350,
    sidebarMenu(
      menuItem("Filtros generales", tabName = "filtros", icon = icon("filter")),
      dateRangeInput(
        inputId = "rango_fechas",
        label = "Periodo de analisis",
        start = fecha_min,
        end = fecha_max,
        min = fecha_min,
        max = fecha_max,
        format = "yyyy-mm-dd",
        language = "es",
        separator = " a "
      ),
      selectInput("departamento", "Departamento", choices = NULL, selected = "Todos"),
      selectInput("municipio", "Municipio", choices = "Todos", selected = "Todos"),
      hr(),
      selectInput("categoria_principal", "Categoria principal", choices = NULL, selected = "Todas"),
      selectInput("subcategoria", "Subcategoria", choices = "Todas", selected = "Todas"),
      hr(),
      selectInput("afectacion", "Afectacion especifica", choices = NULL, selected = "Todos"),
      selectInput("estado", "Estado del caso", choices = NULL, selected = "Todos"),
      selectInput("autor", "Tipo de autor", choices = NULL, selected = "Todos"),
      hr(),
      actionButton("limpiar", "Limpiar filtros", icon = icon("eraser"), width = "100%")
    )
  ),
  dashboardBody(
    tags$head(tags$style(HTML("\n      .content-wrapper, .right-side { background-color: #f4f6f9; }\n      .box { border-radius: 8px; }\n      .small-box { border-radius: 8px; }\n      .main-header .logo { font-weight: bold; }\n      .dataTables_wrapper { font-size: 12px; }\n    "))),
    fluidRow(
      valueBoxOutput("kpi_total", width = 3),
      valueBoxOutput("kpi_deptos", width = 3),
      valueBoxOutput("kpi_mpios", width = 3),
      valueBoxOutput("kpi_incidencias", width = 3)
    ),
    tabBox(
      width = 12,
      title = "Analisis situacional",
      id = "tabs",
      tabPanel(
        "Resumen territorial",
        fluidRow(
          box(width = 6, title = "Casos por departamento", status = "primary", solidHeader = TRUE, plotlyOutput("graf_departamento", height = 430)),
          box(width = 6, title = "Casos por municipio segun departamento seleccionado", status = "primary", solidHeader = TRUE, plotlyOutput("graf_municipio", height = 430))
        ),
        fluidRow(
          box(width = 12, title = "Ranking territorial", status = "info", solidHeader = TRUE, DTOutput("tabla_territorial"))
        )
      ),
      tabPanel(
        "Categorias y subcategorias",
        fluidRow(
          box(width = 6, title = "Incidencias por categoria principal", status = "primary", solidHeader = TRUE, plotlyOutput("graf_categoria_principal", height = 390)),
          box(width = 6, title = "Incidencias por subcategoria", status = "primary", solidHeader = TRUE, plotlyOutput("graf_subcategoria", height = 390))
        ),
        fluidRow(
          box(width = 12, title = "Matriz categoria principal / subcategoria", status = "info", solidHeader = TRUE, DTOutput("tabla_categoria_subcategoria"))
        ),
        fluidRow(
          box(width = 12, title = "Registros no clasificados en el catalogo oficial", status = "warning", solidHeader = TRUE, DTOutput("tabla_no_clasificados"))
        )
      ),
      tabPanel(
        "Tendencia temporal",
        fluidRow(
          box(width = 12, title = "Evolucion mensual de casos", status = "primary", solidHeader = TRUE, plotlyOutput("graf_tiempo", height = 420))
        ),
        fluidRow(
          box(width = 6, title = "Casos por semana", status = "info", solidHeader = TRUE, plotlyOutput("graf_semana", height = 360)),
          box(width = 6, title = "Distribucion por anio", status = "info", solidHeader = TRUE, plotlyOutput("graf_anio", height = 360))
        )
      ),
      tabPanel(
        "Caracterizacion complementaria",
        fluidRow(
          box(width = 6, title = "Afectacion especifica", status = "primary", solidHeader = TRUE, plotlyOutput("graf_afectacion", height = 380)),
          box(width = 6, title = "Tipo de autor", status = "primary", solidHeader = TRUE, plotlyOutput("graf_autor", height = 380))
        ),
        fluidRow(
          box(width = 6, title = "Estado del caso", status = "info", solidHeader = TRUE, plotlyOutput("graf_estado", height = 380)),
          box(width = 6, title = "Tipo de institucion", status = "info", solidHeader = TRUE, plotlyOutput("graf_institucion", height = 380))
        )
      ),
      tabPanel(
        "Mapa",
        fluidRow(
          box(width = 12, title = "Georreferenciacion de casos con latitud y longitud", status = "primary", solidHeader = TRUE, leafletOutput("mapa", height = 620))
        )
      ),
      tabPanel(
        "Base filtrada",
        fluidRow(
          box(width = 12, title = "Registros que cumplen los filtros seleccionados", status = "primary", solidHeader = TRUE, DTOutput("tabla_base"))
        )
      )
    )
  )
)

# 8) SERVIDOR -----------------------------------------------------------------
server <- function(input, output, session) {
  
  observe({
    updateSelectInput(session, "departamento", choices = c("Todos", sort(unique(base$departamento))), selected = "Todos")
    updateSelectInput(session, "categoria_principal", choices = c("Todas", unique(catalogo_categorias$categoria_principal), "Sin clasificar"), selected = "Todas")
    updateSelectInput(session, "afectacion", choices = c("Todos", sort(unique(base$afectacion))), selected = "Todos")
    updateSelectInput(session, "estado", choices = c("Todos", sort(unique(base$estado_caso))), selected = "Todos")
    updateSelectInput(session, "autor", choices = c("Todos", sort(unique(base$tipo_autor))), selected = "Todos")
  })
  
  observeEvent(input$departamento, {
    datos_mpio <- base
    if (!is.null(input$departamento) && input$departamento != "Todos") {
      datos_mpio <- datos_mpio %>% filter(departamento == input$departamento)
    }
    updateSelectInput(session, "municipio", choices = c("Todos", sort(unique(datos_mpio$municipio))), selected = "Todos")
  }, ignoreInit = FALSE)
  
  observeEvent(input$categoria_principal, {
    if (is.null(input$categoria_principal) || input$categoria_principal == "Todas") {
      opciones <- sort(unique(catalogo_categorias$subcategoria))
    } else if (input$categoria_principal == "Sin clasificar") {
      opciones <- sort(unique(base_categorias$subcategoria[base_categorias$categoria_principal == "Sin clasificar"]))
    } else {
      opciones <- catalogo_categorias %>%
        filter(categoria_principal == input$categoria_principal) %>%
        pull(subcategoria)
    }
    updateSelectInput(session, "subcategoria", choices = c("Todas", opciones), selected = "Todas")
  }, ignoreInit = FALSE)
  
  observeEvent(input$limpiar, {
    updateDateRangeInput(session, "rango_fechas", start = fecha_min, end = fecha_max)
    updateSelectInput(session, "departamento", selected = "Todos")
    updateSelectInput(session, "municipio", selected = "Todos")
    updateSelectInput(session, "categoria_principal", selected = "Todas")
    updateSelectInput(session, "subcategoria", selected = "Todas")
    updateSelectInput(session, "afectacion", selected = "Todos")
    updateSelectInput(session, "estado", selected = "Todos")
    updateSelectInput(session, "autor", selected = "Todos")
  })
  
  ids_por_filtro_categoria <- reactive({
    ids <- base$id_caso
    if (!is.null(input$categoria_principal) && input$categoria_principal != "Todas") {
      ids <- base_categorias %>%
        filter(categoria_principal == input$categoria_principal) %>%
        pull(id_caso) %>%
        unique()
    }
    if (!is.null(input$subcategoria) && input$subcategoria != "Todas") {
      ids_sub <- base_categorias %>%
        filter(subcategoria == input$subcategoria) %>%
        pull(id_caso) %>%
        unique()
      ids <- intersect(ids, ids_sub)
    }
    ids
  })
  
  datos_filtrados <- reactive({
    req(input$rango_fechas)
    datos <- base %>%
      filter(fecha_incidente >= input$rango_fechas[1], fecha_incidente <= input$rango_fechas[2]) %>%
      filter(id_caso %in% ids_por_filtro_categoria())
    
    if (!is.null(input$departamento) && input$departamento != "Todos") datos <- datos %>% filter(departamento == input$departamento)
    if (!is.null(input$municipio) && input$municipio != "Todos") datos <- datos %>% filter(municipio == input$municipio)
    if (!is.null(input$afectacion) && input$afectacion != "Todos") datos <- datos %>% filter(afectacion == input$afectacion)
    if (!is.null(input$estado) && input$estado != "Todos") datos <- datos %>% filter(estado_caso == input$estado)
    if (!is.null(input$autor) && input$autor != "Todos") datos <- datos %>% filter(tipo_autor == input$autor)
    
    datos
  })
  
  categorias_filtradas <- reactive({
    ids <- datos_filtrados()$id_caso
    base_categorias %>% filter(id_caso %in% ids)
  })
  
  output$kpi_total <- renderValueBox({
    valueBox(format(nrow(datos_filtrados()), big.mark = "."), "Total de casos", icon = icon("database"), color = "blue")
  })
  output$kpi_deptos <- renderValueBox({
    valueBox(n_distinct(datos_filtrados()$departamento), "Departamentos", icon = icon("map"), color = "aqua")
  })
  output$kpi_mpios <- renderValueBox({
    valueBox(n_distinct(datos_filtrados()$municipio), "Municipios", icon = icon("location-dot"), color = "green")
  })
  output$kpi_incidencias <- renderValueBox({
    valueBox(format(nrow(categorias_filtradas()), big.mark = "."), "Incidencias categoria/subcategoria", icon = icon("layer-group"), color = "yellow")
  })
  
  graf_barras <- function(datos, variable, titulo_x = "", top_n = 20) {
    if (nrow(datos) == 0) {
      gg <- ggplot() + annotate("text", x = 1, y = 1, label = "Sin datos para los filtros seleccionados") + theme_void()
      return(ggplotly(gg))
    }
    tabla <- datos %>% count(.data[[variable]], name = "casos", sort = TRUE) %>% slice_head(n = top_n)
    names(tabla)[1] <- "variable"
    gg <- ggplot(tabla, aes(x = reorder(variable, casos), y = casos, text = paste0(variable, "<br>Casos: ", casos))) +
      geom_col() +
      coord_flip() +
      labs(x = titulo_x, y = "Numero de casos") +
      theme_minimal(base_size = 12)
    ggplotly(gg, tooltip = "text") %>% layout(margin = list(l = 160, r = 20, b = 50, t = 20))
  }
  
  graf_barras_incidencias <- function(datos, variable, titulo_x = "", top_n = 25) {
    if (nrow(datos) == 0) {
      gg <- ggplot() + annotate("text", x = 1, y = 1, label = "Sin datos para los filtros seleccionados") + theme_void()
      return(ggplotly(gg))
    }
    tabla <- datos %>% count(.data[[variable]], name = "incidencias", sort = TRUE) %>% slice_head(n = top_n)
    names(tabla)[1] <- "variable"
    gg <- ggplot(tabla, aes(x = reorder(variable, incidencias), y = incidencias, text = paste0(variable, "<br>Incidencias: ", incidencias))) +
      geom_col() +
      coord_flip() +
      labs(x = titulo_x, y = "Numero de incidencias") +
      theme_minimal(base_size = 12)
    ggplotly(gg, tooltip = "text") %>% layout(margin = list(l = 190, r = 20, b = 50, t = 20))
  }
  
  output$graf_departamento <- renderPlotly({ graf_barras(datos_filtrados(), "departamento", "Departamento", 30) })
  output$graf_municipio <- renderPlotly({ graf_barras(datos_filtrados(), "municipio", "Municipio", 30) })
  output$graf_categoria_principal <- renderPlotly({ graf_barras_incidencias(categorias_filtradas(), "categoria_principal", "Categoria principal", 10) })
  output$graf_subcategoria <- renderPlotly({ graf_barras_incidencias(categorias_filtradas(), "subcategoria", "Subcategoria", 30) })
  
  output$graf_tiempo <- renderPlotly({
    tabla <- datos_filtrados() %>% count(mes, name = "casos") %>% arrange(mes)
    if (nrow(tabla) == 0) return(ggplotly(ggplot() + annotate("text", x = 1, y = 1, label = "Sin datos") + theme_void()))
    gg <- ggplot(tabla, aes(x = mes, y = casos, text = paste0("Mes: ", mes, "<br>Casos: ", casos))) +
      geom_line(linewidth = 1) + geom_point(size = 2) +
      labs(x = "Mes", y = "Numero de casos") +
      theme_minimal(base_size = 12)
    ggplotly(gg, tooltip = "text")
  })
  
  output$graf_semana <- renderPlotly({
    tabla <- datos_filtrados() %>% count(semana, name = "casos") %>% arrange(semana)
    if (nrow(tabla) == 0) return(ggplotly(ggplot() + annotate("text", x = 1, y = 1, label = "Sin datos") + theme_void()))
    gg <- ggplot(tabla, aes(x = semana, y = casos, text = paste0("Semana: ", semana, "<br>Casos: ", casos))) +
      geom_col() + labs(x = "Semana", y = "Casos") + theme_minimal(base_size = 12)
    ggplotly(gg, tooltip = "text")
  })
  
  output$graf_anio <- renderPlotly({ graf_barras(datos_filtrados(), "anio", "Anio", 10) })
  output$graf_afectacion <- renderPlotly({ graf_barras(datos_filtrados(), "afectacion", "Afectacion", 20) })
  output$graf_autor <- renderPlotly({ graf_barras(datos_filtrados(), "tipo_autor", "Tipo de autor", 20) })
  output$graf_estado <- renderPlotly({ graf_barras(datos_filtrados(), "estado_caso", "Estado del caso", 20) })
  output$graf_institucion <- renderPlotly({ graf_barras(datos_filtrados(), "tipo_institucion", "Tipo de institucion", 20) })
  
  output$tabla_territorial <- renderDT({
    datos_filtrados() %>%
      count(departamento, municipio, name = "casos", sort = TRUE) %>%
      datatable(
        rownames = FALSE,
        extensions = c("Buttons"),
        options = list(pageLength = 15, dom = "Bfrtip", buttons = c("copy", "csv", "excel"), language = list(url = "//cdn.datatables.net/plug-ins/1.10.11/i18n/Spanish.json"))
      )
  })
  
  output$tabla_categoria_subcategoria <- renderDT({
    categorias_filtradas() %>%
      count(categoria_principal, subcategoria, name = "incidencias", sort = TRUE) %>%
      datatable(
        rownames = FALSE,
        extensions = c("Buttons"),
        options = list(pageLength = 15, dom = "Bfrtip", buttons = c("copy", "csv", "excel"), language = list(url = "//cdn.datatables.net/plug-ins/1.10.11/i18n/Spanish.json"))
      )
  })
  
  output$tabla_no_clasificados <- renderDT({
    categorias_filtradas() %>%
      filter(match_catalogo == FALSE) %>%
      count(subcategoria_raw, name = "registros", sort = TRUE) %>%
      datatable(
        rownames = FALSE,
        extensions = c("Buttons"),
        options = list(pageLength = 10, dom = "Bfrtip", buttons = c("copy", "csv", "excel"), language = list(url = "//cdn.datatables.net/plug-ins/1.10.11/i18n/Spanish.json"))
      )
  })
  
  output$tabla_base <- renderDT({
    resumen_cat <- base_categorias %>%
      group_by(id_caso) %>%
      summarise(
        categorias_principales = paste(unique(categoria_principal), collapse = "; "),
        subcategorias = paste(unique(subcategoria), collapse = "; "),
        .groups = "drop"
      )
    
    datos_filtrados() %>%
      left_join(resumen_cat, by = "id_caso") %>%
      select(fecha_incidente, departamento, municipio, categorias_principales, subcategorias, categoria_texto_original, afectacion, tipo_autor, estado_caso, tipo_institucion, everything()) %>%
      datatable(
        rownames = FALSE,
        filter = "top",
        extensions = c("Buttons"),
        options = list(scrollX = TRUE, pageLength = 10, dom = "Bfrtip", buttons = c("copy", "csv", "excel"), language = list(url = "//cdn.datatables.net/plug-ins/1.10.11/i18n/Spanish.json"))
      )
  })
  
  output$mapa <- renderLeaflet({
    puntos <- datos_filtrados() %>%
      filter(!is.na(latitud), !is.na(longitud), latitud != 0, longitud != 0) %>%
      group_by(departamento, municipio, latitud, longitud) %>%
      summarise(casos = n(), .groups = "drop")
    
    mapa_base <- leaflet() %>% addTiles()
    
    if (nrow(puntos) == 0) {
      mapa_base %>% setView(lng = -74.2973, lat = 4.5709, zoom = 5)
    } else {
      mapa_base %>%
        addCircleMarkers(
          data = puntos,
          lng = ~longitud,
          lat = ~latitud,
          radius = ~pmax(5, sqrt(casos) * 3),
          stroke = TRUE,
          fillOpacity = 0.65,
          popup = ~paste0("<b>Departamento:</b> ", departamento,
                          "<br><b>Municipio:</b> ", municipio,
                          "<br><b>Casos:</b> ", casos)
        ) %>%
        fitBounds(lng1 = min(puntos$longitud), lat1 = min(puntos$latitud), lng2 = max(puntos$longitud), lat2 = max(puntos$latitud))
    }
  })
}

# 9) EJECUTAR APLICACION ------------------------------------------------------
#shinyApp(ui = ui, server = server)
options(shiny.host = "0.0.0.0")
options(shiny.port = 5534)

shinyApp(ui = ui, server = server)
