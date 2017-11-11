#extraer datos desde API de Junar, estaditicas de los portales
# endpoint stats ejemplo: 
#http://pilar.cloudapi.junar.com/api/v2/stats/?auth_key=ac0d7fc2804b535637ae44aa5f0bc57c674d3353

#url doc api: https://junar.github.io/docs/es/_sections/07-estadisticas.html

#Librerias

library(httr)
library(jsonlite)
library(dplyr)

##Observaciones##
#Los objetos web, cliente y key, deben ser reemplazados por los del portal que se va a explorar


###Autenticación

web <- "http://datosabiertos.pilar.gov.ar" # url home del cliente
cliente <- "http://pilar.cloudapi.junar.com" # url api cliente
key <- "auth_key=ac0d7fc2804b535637ae44aa5f0bc57c674d3353" # auth_key
url <- "/api/v2/stats/?" # sección url api
req <- fromJSON(paste0(cliente,url, key))

##Recolección datastream
stats_ds <- req$datastreams$stats$resources #hits por recurso
total_ds <- req$datastreams$total # total hits

##Recolección visualization
stats_vz <- req$visualizations$stats$resources #hits por recurso
total_vz <- req$visualizations$total # total de hits

##Recolección dashboard
stats_db <- req$dashboards$stats$resources #hits por recurso
total_db <- req$dashboards$total # total de hits

##Limpieza/seleccion columnas.
# Se agrego columna nueva URL con la direccion completa del recurso

# datstream
  ds_m <-mutate(stats_ds, URL = (paste0( web,stats_ds$landingPage)) ) %>% 
  select('Cantidad Visitas' = count,
         'Nombre Vista' =title,
         'Descripción' = description,
         'URL Vista' = URL,
         'Categoria' = category,
         'GUID' = guid)
  
# Visualizacion
  
  vz_m <-mutate(stats_vz, URL = (paste0( web,stats_vz$landingPage)) ) %>% 
    select('Cantidad Visitas' = count,
           'Nombre Vista' =title,
           'Descripción' = description,
           'URL Vista' = URL,
           'Categoria' = category,
           'GUID' = guid)
  
# Colecciones
  
  db_m <-mutate(stats_db, URL = (paste0( web,stats_db$landingPage)) ) %>% 
    select('Cantidad Visitas' = count,
           'Nombre Vista' =title,
           'Descripción' = description,
           'URL Vista' = URL,
           'Categoria' = category,
           'GUID' = guid)
  
  
             



