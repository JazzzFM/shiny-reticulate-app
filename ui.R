# Import R packages needed for the UI
library(shiny)
library(shinycssloaders)
library(DT)

# Begin UI for the R + reticulate example app
ui <- fluidPage(
  
  titlePanel('Ejemplo de app usando: R Shiny + reticulate'),
  
  sidebarLayout(
    
    # ---------------- Sidebar panel with changeable inputs ----------------- #
    sidebarPanel(
      
      h4('Inputs a funciones de R'),
      radioButtons('dist', 
                   'Tipo de distribución:',
                   choices = c('Normal' = 'norm',
                               'Uniform' = 'unif', 
                               'Log-normal' = 'lnorm', 
                               'Exponential' = 'exp')),
      br(),
      sliderInput('n',
                  'Número de observaciones:',
                  value = 5000,
                  min = 100,
                  max = 10000),
      hr(),
      
      h4('Inputs a funciones de Python por reticulate'),
      textInput('str',
                'Text to display',
                value = 'Texto impreso en python!'),
      numericInput('x',
                   'x value',
                   value = 1),
      numericInput('y',
                   'y value',
                   value = 2)
    ),
    
    # ---------------- Sidebar panel with changeable inputs ----------------- #
    mainPanel(
      
      # Output: Tabset w/ plot, summary, and table ----
      tabsetPanel(type = 'tabs',
                  tabPanel('Usando funciones de R y Python', 
                           br(),
                           h3('Outputs generados por R'),
                           br(),
                           withSpinner(plotOutput('plot')),
                           br(),
                           h3('Outputs generados por Python via reticulate'),
                           verbatimTextOutput('message'),
                           br(),
                           'Use numpy para hacer suma de nímeros',
                           verbatimTextOutput('xy')),
                  tabPanel('Architecture Info', 
                           h3('Current architecture info'),
                           '(These values will change when app is run locally vs on Shinyapps.io)',
                           hr(),
                           withSpinner(DT::dataTableOutput('sysinfo')),
                           br(),
                           verbatimTextOutput('which_python'),
                           verbatimTextOutput('python_version'),
                           verbatimTextOutput('ret_env_var'),
                           verbatimTextOutput('venv_root')
                  )
      )
    )
  )
)