Stat_Total_Clientes.R





  library(jsonlite)
  library(dplyr)
  library(httr)

  ###API OBJETOS####
  
  #Chile
  c1 = ("http://cne.cloudapi.junar.com/api/v2/stats/?auth_key=50ec79952723047e1458e769a02a970a93eccdc5") #cne 
  c2 = ("http://api.recursos.penalolen.cl/api/v2/stats/?auth_key=cf62f2ce9b3a44243fc30544845053aeadb34189") #peñalolen
  c3 = ("http://junaebabierta.cloudapi.junar.com/api/v2/stats/?auth_key=687eb54a7c3a489a81bdbd6608e64d256a9fad3e") #junaeb
  c4 = ("http://mineria.cloudapi.junar.com/api/v2/stats/?auth_key=992333be6c6de9405a04df84ef5d27a5af080c9d") #mineria
  c5 = ("http://mpuentealto.cloudapi.junar.com/api/v2/stats/?auth_key=89463a6e47b704634ea8aa575343ae11be3326f6") #puente alto
  c6 = ("http://api.datos.mineduc.cl/api/v2/stats/?auth_key=f22a0a86919812187e3167e380e6ca84333c1457") #mineduc
  c7 = ("https://api.datos.observatoriologistico.cl/api/v2/stats/?auth_key=0ce0637660dae7c6cc528df48307289698126c52") #mtt

# Argentina
  c8 = ("http://pilar.cloudapi.junar.com/api/v2/stats/?auth_key=ac0d7fc2804b535637ae44aa5f0bc57c674d3353")
  c9 = ("http://api.datos.laplata.gov.ar/api/v2/stats/auth_key=8eede3b515c9dfd6495b1a80afc7127ddd9fa2bf")
  c10 =("http://api.datosabiertos.enacom.gob.ar/api/v2/stats/auth_key=30f4ed1d4b1b27a62c056e8f7967cac885487c2b")
  c11 =("http://lanacion.cloudapi.junar.com/api/v2/stats/auth_key=f1611e2c753ec10958cf0325301ecab24a4885e9")
 c12 = ("http://api.datos.arsat.com.ar/api/v2/stats/?auth_key=f45c05b444d0d5d4c341195e79a47516038b6f08")
 c13 = ("http://api.datos.sanlorenzo.com.ar/api/v2/stats/auth_key=71963ef842204651a6132d8d8eee60f7acd097dc")
 c14 = ("http://vicentelopez.cloudapi.junar.com/api/v2/stats/?auth_key=bd8490be39079aad5e998e951caa13385d2ec052")
 c16 = ("http://api.datos.bahiablanca.gob.ar/api/v2/stats/?auth_key=df7e44427105659297fba23b177d6e77d3d2c264")
 c17 = ("http://tigre.cloudapi.junar.com/api/v2/stats/?auth_key=319bc3d44050c6bdd4c6cea78cafc3ff902aa5f4")
 c19 = ("http://api.datos.villamaria.gob.ar/api/v2/stats/?auth_key=8a9e51f5f02f4e305c46378856980134b20cc29d")
 c20 = ("http://api.datos.lujan.gov.ar/api/v2/stats/?auth_key=54500f1c13885266f228d603dae32e6ca1c95bb8")
 
 #Peru
 c21 = ("http://oefa.cloudapi.junar.com/api/v2/stats/?auth_key=ffd5ad5c4b0675e12ccacb58d03fd4c13cf334a4")
 c23 = ("http://api.datosabiertos.mef.gob.pe/api/v2/stats/?auth_key=c3fb0e2430db0c86549c0c6836407f31fee1228e")
 c24 = ("http://api.datos.agrorural.gob.pe/api/v2/stats/?auth_key=ea9ab1569ae563edcb86ffd01b0c721b4b113f1f")
 c25 = ("http://miraflores.cloudapi.junar.com/api/v2/stats/?auth_key=9655388a2fdaa944358e6fa76bb469db09a8e270")
 c26 = ("http://api.datosabiertos.msi.gob.pe/api/v2/stats/?auth_key=d7c8b1df88eb5ac16c021e97e46fe40679ff71ca")
 c27 = ("http://api.datosabiertos.mef.gob.pe/api/v2/stats/?auth_key=371fe013bc344033609c0a5e7dc4036bef0a3fe0")
 c28 = ("http://oefa.cloudapi.junar.com/api/v2/stats/?auth_key=ea5b5439c5821fe45b9c357a731e25e5a171e461")
 c29 = ("http://senace.cloudapi.junar.com/api/v2/stats/?auth_key=ad6cd39a204e567492b8b8e36ef713fe78f3d6c6")

 #USA
 c30 = ("http://paloalto.cloudapi.junar.com/api/v2/stats/?auth_key=95b919eef0d6d80a19fd54dd67f431e070737579")
 c31 = ("https://api.data.sanjoseca.gov/api/v2/stats/?auth_key=16c9c574f6552e5431f5d11bf576f0f1bd8bf10f")
 c32 = ("http://api.open.mesaaz.gov/api/v2/stats/?auth_key=2db989e127d370149b9dbcf3b5ccc642cc2b309b")
 c32 = ("http://cupertino.cloudapi.junar.com/api/v2/stats/?auth_key=1663e3c7e228d4b114097d7aa853cada3f882c70")
 c33 = ("http://anaheim.cloudapi.junar.com/api/v2/stats/?auth_key=66c00f278bc9f2305ac4072796ad7b93162c80c2")
 c34 = ("http://api.data.rtachicago.org/api/v2/stats/?auth_key=3ffdded7ae0ff2f0dc66bb2a634397304cbca669")
 c35 = ("https://api.data.arlingtonva.us/api/v2/stats/?auth_key=94865ce516530b957f028dc61221b6fb83c6dce9")
 c36 = ("http://saccounty.cloudapi.junar.com/api/v2/stats/?auth_key=3bbe818514f91f8200953a4914182ae86d16f3c0")
 c37 = ("http://jacksonmi.cloudapi.junar.com/api/v2/stats/?auth_key=e79f8a1d42b5423246ff6033744b862b013b51f4")
 

 #CostaRica
 c38 = ("http://api.datosabiertos.iafa.go.cr/api/v2/stats/?auth_key=429bb5a3b1ea816483c90385cd5c31f70d59a5ea")
 c39 = ("http://mopt.cloudapi.junar.com/api/v2/stats/?auth_key=c8510cd6f3a76509ebe0c7ace210cae3b4cd0c7b")
 c40 = ("http://escazu.cloudapi.junar.com/api/v2/stats/?auth_key=a6c9c2a20207a8d4973481a8a3f9474930f5dc62")
 c41 = ("http://api.datosabiertos.msj.go.cr/api/v2/stats/?auth_key=291226a554075bd8f6ac59cd59bf8517f5d70203")
 c42 = ("http://api.datosabiertos.presidencia.go.cr/api/v2/stats/?auth_key=4829b2af3b9e160a3d24a0d595cfb14c05997667")
 c43 = ("http://api.datos.munipalmares.go.cr/api/v2/stats/?auth_key=54dfb7928021698d55bcef06a7f8b2357f2ae3f3")
 
 #Otro
 c44 = ("http://api.es.infralatam.info/api/v2/stats/?auth_key=7e6e99a2c61b5210ad947d4aa4e7087d4954340f")

#####################################################################################################
#####################################################################################################
############GET QUERY POR TOTAL SEGUN CANAL###########################################################

 #Retorna los totales por canal, sin indentificar la cuenta

C1 <- fromJSON(c1, flatten = TRUE)
C1 <- C1$datastreams$stats$channels$channels
C2 <- fromJSON(c2, flatten = TRUE)
C2 <- C2$datastreams$stats$channels$channels
C3 <- fromJSON(c3, flatten = TRUE)
C3 <- C3$datastreams$stats$channels$channels
C4 <- fromJSON(c4, flatten = TRUE)
C4 <- C4$datastreams$stats$channels$channels
C5 <- fromJSON(c5, flatten = TRUE)
C5 <- C5$datastreams$stats$channels$channels

## Unir datos en una tabla
TOTAL <- rbind (C1,C2,C3,C4,C5) # dataframe contiene lo recolectado desde channels



##Suma totales
TotalHits = colSums (TOTAL [, 1, drop=FALSE]) #suma todo

TotalAPI =  filter (TOTAL, channel=="CHANNEL_TYPE_API") %>% #suma por total canal API
  summarise(sum(total))
  
TotalWEB = filter(TOTAL, channel=="CHANNEL_TYPE_WEB") %>% #suma por total canal WEB
  summarise(sum(total))

###Guardar archivo TOTAL

write.csv(TOTAL, "~/TotalHitsClientes.csv", row.names = FALSE)

#############################################################################################
########################QUERY POR CUENTA#################### 

#Retorna los totales por cuenta

A1 <- fromJSON(c1, flatten = TRUE)
A1 <- A1$datastreams$stats$accounts$accounts
A2 <- fromJSON(c2, flatten = TRUE)
A2 <- A2$datastreams$stats$accounts$accounts
A3 <- fromJSON(c3, flatten = TRUE)
A3 <- A3$datastreams$stats$accounts$accounts
A4 <- fromJSON(c4, flatten = TRUE)
A4 <- A4$datastreams$stats$accounts$accounts
A5 <- fromJSON(c5, flatten = TRUE)
A5 <- A5$datastreams$stats$accounts$accounts


#### Unir datos en una tabla
TOTAL_A <- rbind (A1,A2,A3,A4,A5) # dataframe contiene lo recolectado desde accounts

##EXPORTAR DESC.


#################################################################################################
#########################POR PAIS#############################################

##Querys por pais

## Chile

## Argentina

## Peru

## USA

## CostaRica

##Otro







