# ============================================================
# DASHBOARD MISIÓN MÉDICA - Casos por departamento y municipio
# Base revisada: fecha incidente = columna D, departamento = columna S, municipio = columna T
# Archivo esperado en la misma carpeta del app.R: mm2026mayo.xlsx
# ============================================================

# 1) INSTALAR PAQUETES SOLO LA PRIMERA VEZ --------------------
paquetes <- c("shiny", "shinydashboard", "readxl", "dplyr", "lubridate", "ggplot2", "DT", "stringr", "scales")
instalar <- paquetes[!paquetes %in% rownames(installed.packages())]
if (length(instalar) > 0) install.packages(instalar, dependencies = TRUE)

# 2) CARGAR LIBRERÍAS -----------------------------------------
library(shiny)
library(shinydashboard)
library(readxl)
library(dplyr)
library(lubridate)
library(ggplot2)
library(DT)
library(stringr)
library(scales)

# 3) FUNCIÓN PARA CONVERTIR FECHAS DE EXCEL -------------------
# La columna D viene como número serial de Excel en la base revisada.
convertir_fecha_excel <- function(x) {
  if (inherits(x, "Date")) return(x)
  if (inherits(x, "POSIXct") || inherits(x, "POSIXt")) return(as.Date(x))
  
  x_chr <- as.character(x)
  x_num <- suppressWarnings(as.numeric(x_chr))
  
  fecha <- suppressWarnings(as.Date(x_num, origin = "1899-12-30"))
  
  # Respaldo por si en otra versión la fecha llega como texto tipo 05/25/2026
  fecha_texto <- suppressWarnings(mdy(x_chr))
  fecha[is.na(fecha) & !is.na(fecha_texto)] <- as.Date(fecha_texto[is.na(fecha) & !is.na(fecha_texto)])
  
  return(fecha)
}

# 4) CARGAR Y DEPURAR DATOS -----------------------------------
ruta_archivo <- "mm2026mayo.xlsx"

bd_original <- read_excel(ruta_archivo, sheet = 1)

bd <- bd_original %>%
  transmute(
    fecha_incidente = convertir_fecha_excel(.[[4]]),   # Columna D
    departamento    = str_squish(str_to_upper(as.character(.[[19]]))), # Columna S
    municipio       = str_squish(str_to_upper(as.character(.[[20]])))  # Columna T
  ) %>%
  filter(!is.na(fecha_incidente), !is.na(departamento), departamento != "") %>%
  mutate(
    municipio = if_else(is.na(municipio) | municipio == "", "SIN MUNICIPIO", municipio)
  )

fecha_min <- min(bd$fecha_incidente, na.rm = TRUE)
fecha_max <- max(bd$fecha_incidente, na.rm = TRUE)

# 5) INTERFAZ DEL DASHBOARD -----------------------------------
ui <- dashboardPage(
  dashboardHeader(title = "Dashboard Misión Médica"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Análisis", tabName = "analisis", icon = icon("chart-bar"))
    ),
    dateRangeInput(
      inputId = "rango_fechas",
      label = "Periodo de análisis:",
      start = fecha_min,
      end = fecha_max,
      min = fecha_min,
      max = fecha_max,
      format = "yyyy-mm-dd",
      language = "es",
      separator = " hasta "
    ),
    selectInput(
      inputId = "departamento_sel",
      label = "Departamento:",
      choices = c("Todos" = "Todos", sort(unique(bd$departamento))),
      selected = "Todos"
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(
        tabName = "analisis",
        fluidRow(
          valueBoxOutput("total_casos", width = 4),
          valueBoxOutput("total_departamentos", width = 4),
          valueBoxOutput("total_municipios", width = 4)
        ),
        fluidRow(
          box(
            title = "Número de casos por departamento",
            width = 12,
            status = "primary",
            solidHeader = TRUE,
            plotOutput("graf_departamentos", height = "420px")
          )
        ),
        fluidRow(
          box(
            title = "Número de casos por municipio del departamento seleccionado",
            width = 12,
            status = "info",
            solidHeader = TRUE,
            plotOutput("graf_municipios", height = "420px")
          )
        ),
        fluidRow(
          box(
            title = "Tabla resumen por municipio",
            width = 12,
            status = "warning",
            solidHeader = TRUE,
            DTOutput("tabla_municipios")
          )
        )
      )
    )
  )
)

# 6) SERVIDOR DEL DASHBOARD -----------------------------------
server <- function(input, output, session) {
  
  datos_filtrados <- reactive({
    req(input$rango_fechas)
    
    datos <- bd %>%
      filter(
        fecha_incidente >= input$rango_fechas[1],
        fecha_incidente <= input$rango_fechas[2]
      )
    
    if (input$departamento_sel != "Todos") {
      datos <- datos %>% filter(departamento == input$departamento_sel)
    }
    
    datos
  })
  
  output$total_casos <- renderValueBox({
    valueBox(
      value = comma(nrow(datos_filtrados())),
      subtitle = "Casos en el periodo seleccionado",
      icon = icon("list"),
      color = "blue"
    )
  })
  
  output$total_departamentos <- renderValueBox({
    valueBox(
      value = n_distinct(datos_filtrados()$departamento),
      subtitle = "Departamentos con casos",
      icon = icon("map"),
      color = "green"
    )
  })
  
  output$total_municipios <- renderValueBox({
    valueBox(
      value = n_distinct(datos_filtrados()$municipio),
      subtitle = "Municipios con casos",
      icon = icon("location-dot"),
      color = "yellow"
    )
  })
  
  output$graf_departamentos <- renderPlot({
    datos <- datos_filtrados() %>%
      count(departamento, name = "casos") %>%
      arrange(desc(casos))
    
    validate(need(nrow(datos) > 0, "No hay datos para el periodo seleccionado."))
    
    ggplot(datos, aes(x = reorder(departamento, casos), y = casos)) +
      geom_col() +
      coord_flip() +
      geom_text(aes(label = casos), hjust = -0.1, size = 4) +
      labs(x = "Departamento", y = "Número de casos") +
      expand_limits(y = max(datos$casos) * 1.12) +
      theme_minimal(base_size = 13)
  })
  
  output$graf_municipios <- renderPlot({
    datos <- datos_filtrados() %>%
      count(municipio, name = "casos") %>%
      arrange(desc(casos)) %>%
      slice_head(n = 30)
    
    validate(need(nrow(datos) > 0, "No hay datos para el periodo y departamento seleccionados."))
    
    ggplot(datos, aes(x = reorder(municipio, casos), y = casos)) +
      geom_col() +
      coord_flip() +
      geom_text(aes(label = casos), hjust = -0.1, size = 4) +
      labs(x = "Municipio", y = "Número de casos") +
      expand_limits(y = max(datos$casos) * 1.12) +
      theme_minimal(base_size = 13)
  })
  
  output$tabla_municipios <- renderDT({
    datos_filtrados() %>%
      count(departamento, municipio, name = "casos") %>%
      arrange(desc(casos), departamento, municipio) %>%
      datatable(
        rownames = FALSE,
        filter = "top",
        options = list(pageLength = 10, language = list(url = "//cdn.datatables.net/plug-ins/1.13.6/i18n/es-ES.json"))
      )
  })
}

# 7) EJECUTAR APLICACIÓN --------------------------------------
shinyApp(ui = ui, server = server)
