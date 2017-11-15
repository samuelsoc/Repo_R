Stat_Total_Clientes.R


  library(jsonlite)
  library(dplyr)
  library(httr)
  
  
  c1 = ("http://cne.cloudapi.junar.com/api/v2/stats/?auth_key=50ec79952723047e1458e769a02a970a93eccdc5")
  c2 = ("http://pilar.cloudapi.junar.com/api/v2/stats/?auth_key=ac0d7fc2804b535637ae44aa5f0bc57c674d3353")
  c3 = ("http://junaebabierta.cloudapi.junar.com/api/v2/stats/?auth_key=687eb54a7c3a489a81bdbd6608e64d256a9fad3e")
  c4 = ("http://mineria.cloudapi.junar.com/api/v2/stats/?auth_key=992333be6c6de9405a04df84ef5d27a5af080c9d")
  c5 = ("http://mpuentealto.cloudapi.junar.com/api/v2/stats/?auth_key=89463a6e47b704634ea8aa575343ae11be3326f6")
  c6 = ("http://api.recursos.penalolen.cl/api/v2/stats/?auth_key=cf62f2ce9b3a44243fc30544845053aeadb34189")
  c7 = ("http://api.datos.arsat.com.ar/api/v2/stats/?auth_key=f45c05b444d0d5d4c341195e79a47516038b6f08")
  c8 = ("http://api.datos.sanlorenzo.com.ar/api/v2/stats/auth_key=71963ef842204651a6132d8d8eee60f7acd097dc")
  c9 = ("http://api.datos.laplata.gov.ar/api/v2/stats/auth_key=8eede3b515c9dfd6495b1a80afc7127ddd9fa2bf")
  c10 =("http://api.datosabiertos.enacom.gob.ar/api/v2/stats/auth_key=30f4ed1d4b1b27a62c056e8f7967cac885487c2b")
  c11 =("http://lanacion.cloudapi.junar.com/api/v2/stats/auth_key=f1611e2c753ec10958cf0325301ecab24a4885e9")
c12 = GET("")
c13 = GET("")
c14 = GET("")
c15 = GET("")
c16 = GET("")
c17 = GET("")
c18 = GET("")
c19 = GET("")
c20 = GET("")
c21 = GET("")
c22 = GET("")
c23 = GET("")
c24 = GET("")
c25 = GET("")
c26 = GET("")
c27 = GET("")

## Objetos

C1 <- fromJSON(c1, flatten = TRUE)
C1 <- C1$datastreams$stats$channels$channels
C2 <- fromJSON(c2, flatten = TRUE)
C2 <- C2$datastreams$stats$channels$channels

## Unir datos en una tabla
TOTAL <- rbind (C1,C2) # dataframe contiene lo recolectado desde channels


##Suma totales
TotalHits = colSums (TOTAL [, 1, drop=FALSE]) #suma todo

TotalAPI =  filter (TOTAL, channel=="CHANNEL_TYPE_API") %>% #suma por total canal API
  summarise(sum(total))
  
TotalWEB = filter(TOTAL, channel=="CHANNEL_TYPE_WEB") %>% #suma por total canal WEB
  summarise(sum(total))

###Guardar archivo TOTAL

write.csv(TOTAL, "~/TotalHitsClientes.csv", row.names = FALSE)