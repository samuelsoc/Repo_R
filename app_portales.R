
library(shiny)

library(jsonlite)
library(dplyr)
library(httr)

ui <- fluidPage(
   
   
   titlePanel("Estaditiscas de Hits "),
   
   # Lista de portales
   sidebarLayout(
      sidebarPanel(
        selectInput("Portales", "Seleccionar un Portal:", 
                    choices = c("Peñalolen", 
                                "Junaeb Abierta","Mineduc", "Puente Alto", "MTT",
                                "CNE", "Mineria Abierta")),
        
        actionButton("go", "Aplicar"),
        hr(),
        downloadButton('downloadData', 'Descargar')
        
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         tableOutput("tabla1")
         #hr(),
         #plotOutput("Grafico1")
      
      )
   )
)

###  SERVER ####


server <- function(input, output) {
  
  
 
  c1 = ("http://cne.cloudapi.junar.com/api/v2/stats/?auth_key=50ec79952723047e1458e769a02a970a93eccdc5") #cne 
  c2 = ("http://api.recursos.penalolen.cl/api/v2/stats/?auth_key=cf62f2ce9b3a44243fc30544845053aeadb34189") #peñalolen
  c3 = ("http://junaebabierta.cloudapi.junar.com/api/v2/stats/?auth_key=687eb54a7c3a489a81bdbd6608e64d256a9fad3e") #junaeb
  c4 = ("http://mineria.cloudapi.junar.com/api/v2/stats/?auth_key=992333be6c6de9405a04df84ef5d27a5af080c9d") #mineria
  c5 = ("http://mpuentealto.cloudapi.junar.com/api/v2/stats/?auth_key=89463a6e47b704634ea8aa575343ae11be3326f6") #puente alto
  c6 = ("http://api.datos.mineduc.cl/api/v2/stats/?auth_key=f22a0a86919812187e3167e380e6ca84333c1457") #mineduc
  c7 = ("https://api.datos.observatoriologistico.cl/api/v2/stats/?auth_key=0ce0637660dae7c6cc528df48307289698126c52") #mtt
  c8 = ("http://pilar.cloudapi.junar.com/api/v2/stats/?auth_key=ac0d7fc2804b535637ae44aa5f0bc57c674d3353")#pilar
  
  #parametros
  dd <-"&days=30"

  #gets
  
  C1<- fromJSON(paste0(c1,dd), flatten = TRUE)
  C1<- C1$datastreams$stats$resources
  A1 <- C1 %>% 
    select('Cantidad Visitas' = count,
           'Nombre Vista' =title,
           'Descripción' = description,
          # 'URL Vista' = URL,
           'Categoria' = category,
           'GUID' = guid)
  
  C2<- fromJSON(paste0(c2,dd), flatte = TRUE)
  C2<- C2$datastream$stats$resources
  A2 <- C2 %>% 
    select('Cantidad Visitas' = count,
           'Nombre Vista' =title,
           'Descripción' = description,
           #'URL Vista' = URL,
           'Categoria' = category,
           'GUID' = guid)
  
  C3<- fromJSON(paste0(c3,dd), flatte = TRUE)
  C3<- C3$datastream$stats$resources
  A3 <- C3 %>% 
    select('Cantidad Visitas' = count,
           'Nombre Vista' =title,
           'Descripción' = description,
           #'URL Vista' = URL,
           'Categoria' = category,
           'GUID' = guid)

  
  ###########################################
  
  #cómo puedo hacer que al seleccionar una opcion de la lista, haga el get correspondiente?
  # ejemplo, SI selcciono "CNE", que se ejecute "C1"
  # es importante que se ejecute el get para hacer una cnsulta nueva a la API
  
  
  
 #condicionar una Query a una selccion de la Lista 
  
  
  
  
 #resultados de la query 
  result <- reactive(
    
   {A3   #SI CAMBIAS POR A1, O A2 HACE EL GET NUEVO
     })
   
  #tabla con resultados de la query 
  output$tabla1 = renderTable(
    result()
    
  )
  
  
  
  
}

# Run the application 
shinyApp(ui = ui, server = server)

