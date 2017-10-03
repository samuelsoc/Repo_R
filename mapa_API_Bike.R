#Fuente: https://cran.r-project.org/web/packages/jsonlite/vignettes/json-apis.html
#Objetivo: Obtener datos desde una API. 
#Datos en formato json
#Visualizar datos georeferenciados

#Librerias
library(jsonlite)
library(leaflet)


#recolección datos desde API
citibike <- fromJSON("http://citibikenyc.com/stations/json") #llamar json
stations <- citibike$stationBeanList #path a los datos dentro de stationBeanList
colnames(stations) # ver nombre columnas
View(stations) #ver datos como dataframe

# mapa centrado sin datos
BK = leaflet(stations) %>%  
  addProviderTiles("CartoDB.Positron", options = providerTileOptions(noWrap = TRUE)) %>% 
  setView(-74.00674,40.73172, zoom = 13)

#paleta de colores para dos categorias
pal <- colorFactor(
  palette = c('green', 'red'),
  domain = stations$statusValue
)

# visualización del mapa con  statusValue, son dos categorias
BK %>% 
  addCircleMarkers(~longitude, ~latitude,
             popup = as.character(stations$statusValue),
             radius = 5,
             color = ~pal(statusValue)) %>% 
  addLegend("bottomleft", pal = pal, 
            values = ~statusValue, 
            labels = "Estado Estación", 
            title = "Estado de la Estación") 

