##https://cran.r-project.org/web/packages/jsonlite/vignettes/json-paging.html

#Objetivos: Traer todas las paginas desde una api
#Comentarios: En elc aso de esta api leylobby no se pudo traer mas de 10 casos por pagina, se hizo pagina apagina el llamado


library(jsonlite)


# todas las paginas o varias a la vez

baseurl <- "https://www.leylobby.gob.cl/api/v1/instituciones?"
pages <- list()
for(i in 0:100){
  mydata <- fromJSON(paste0(baseurl, "&page=*", i))
  message("Retrieving page ", i)
  pages[[i+1]] <- mydata$data
}

#######################################

#Pedir pagina por pagina

baseurl <- "https://www.leylobby.gob.cl/api/v1/instituciones?"
mydata0 <- fromJSON(paste0(baseurl, "&page=0"), flatten = TRUE)
mydata1 <- fromJSON(paste0(baseurl, "&page=1"), flatten = TRUE)
mydata2 <- fromJSON(paste0(baseurl, "&page=2"), flatten = TRUE)
mydata3 <- fromJSON(paste0(baseurl, "&page=3"), flatten = TRUE)
mydata4 <- fromJSON(paste0(baseurl, "&page=4"), flatten = TRUE)
mydata5 <- fromJSON(paste0(baseurl, "&page=5"), flatten = TRUE)
mydata6 <- fromJSON(paste0(baseurl, "&page=6"), flatten = TRUE)
mydata7 <- fromJSON(paste0(baseurl, "&page=7"), flatten = TRUE)
mydata8 <- fromJSON(paste0(baseurl, "&page=8"), flatten = TRUE)
mydata9 <- fromJSON(paste0(baseurl, "&page=9"), flatten = TRUE)
mydata10 <- fromJSON(paste0(baseurl, "&page=10"), flatten = TRUE)
mydata11 <- fromJSON(paste0(baseurl, "&page=11"), flatten = TRUE)
mydata12 <- fromJSON(paste0(baseurl, "&page=12"), flatten = TRUE)
mydata13 <- fromJSON(paste0(baseurl, "&page=13"), flatten = TRUE)
mydata14 <- fromJSON(paste0(baseurl, "&page=14"), flatten = TRUE)
mydata15 <- fromJSON(paste0(baseurl, "&page=15"), flatten = TRUE)
mydata16 <- fromJSON(paste0(baseurl, "&page=16"), flatten = TRUE)
mydata17 <- fromJSON(paste0(baseurl, "&page=17"), flatten = TRUE)
mydata18 <- fromJSON(paste0(baseurl, "&page=18"), flatten = TRUE)
mydata19 <- fromJSON(paste0(baseurl, "&page=19"), flatten = TRUE)
mydata20 <- fromJSON(paste0(baseurl, "&page=20"), flatten = TRUE)
mydata21 <- fromJSON(paste0(baseurl, "&page=21"), flatten = TRUE)
mydata22 <- fromJSON(paste0(baseurl, "&page=22"), flatten = TRUE)
mydata23 <- fromJSON(paste0(baseurl, "&page=23"), flatten = TRUE)
mydata24 <- fromJSON(paste0(baseurl, "&page=24"), flatten = TRUE)
mydata25 <- fromJSON(paste0(baseurl, "&page=25"), flatten = TRUE)
mydata26 <- fromJSON(paste0(baseurl, "&page=26"), flatten = TRUE)
mydata27 <- fromJSON(paste0(baseurl, "&page=27"), flatten = TRUE)
mydata28 <- fromJSON(paste0(baseurl, "&page=28"), flatten = TRUE)
mydata29 <- fromJSON(paste0(baseurl, "&page=29"), flatten = TRUE)
mydata30 <- fromJSON(paste0(baseurl, "&page=30"), flatten = TRUE)
mydata31 <- fromJSON(paste0(baseurl, "&page=31"), flatten = TRUE)
mydata32 <- fromJSON(paste0(baseurl, "&page=32"), flatten = TRUE)
mydata33 <- fromJSON(paste0(baseurl, "&page=33"), flatten = TRUE)
mydata34 <- fromJSON(paste0(baseurl, "&page=34"), flatten = TRUE)
mydata35 <- fromJSON(paste0(baseurl, "&page=35"), flatten = TRUE)
mydata36 <- fromJSON(paste0(baseurl, "&page=36"), flatten = TRUE)
mydata37 <- fromJSON(paste0(baseurl, "&page=37"), flatten = TRUE)
mydata38 <- fromJSON(paste0(baseurl, "&page=38"), flatten = TRUE)
mydata39 <- fromJSON(paste0(baseurl, "&page=39"), flatten = TRUE)
mydata40 <- fromJSON(paste0(baseurl, "&page=40"), flatten = TRUE)
mydata41 <- fromJSON(paste0(baseurl, "&page=41"), flatten = TRUE)
mydata42 <- fromJSON(paste0(baseurl, "&page=42"), flatten = TRUE)
mydata43 <- fromJSON(paste0(baseurl, "&page=43"), flatten = TRUE)
mydata44 <- fromJSON(paste0(baseurl, "&page=44"), flatten = TRUE)
mydata45 <- fromJSON(paste0(baseurl, "&page=45"), flatten = TRUE)
mydata46 <- fromJSON(paste0(baseurl, "&page=46"), flatten = TRUE)
mydata47 <- fromJSON(paste0(baseurl, "&page=47"), flatten = TRUE)
mydata48 <- fromJSON(paste0(baseurl, "&page=48"), flatten = TRUE)
mydata49 <- fromJSON(paste0(baseurl, "&page=49"), flatten = TRUE)
mydata50 <- fromJSON(paste0(baseurl, "&page=50"), flatten = TRUE)
mydata51 <- fromJSON(paste0(baseurl, "&page=51"), flatten = TRUE)
mydata52 <- fromJSON(paste0(baseurl, "&page=52"), flatten = TRUE)
mydata53 <- fromJSON(paste0(baseurl, "&page=53"), flatten = TRUE)
mydata54 <- fromJSON(paste0(baseurl, "&page=54"), flatten = TRUE)
mydata55 <- fromJSON(paste0(baseurl, "&page=55"), flatten = TRUE)
mydata56 <- fromJSON(paste0(baseurl, "&page=56"), flatten = TRUE)
mydata57 <- fromJSON(paste0(baseurl, "&page=57"), flatten = TRUE)
mydata58 <- fromJSON(paste0(baseurl, "&page=58"), flatten = TRUE)
mydata59 <- fromJSON(paste0(baseurl, "&page=59"), flatten = TRUE)
mydata60 <- fromJSON(paste0(baseurl, "&page=60"), flatten = TRUE)
mydata61 <- fromJSON(paste0(baseurl, "&page=61"), flatten = TRUE)
mydata62 <- fromJSON(paste0(baseurl, "&page=62"), flatten = TRUE)
mydata63 <- fromJSON(paste0(baseurl, "&page=63"), flatten = TRUE)
mydata64 <- fromJSON(paste0(baseurl, "&page=64"), flatten = TRUE)
mydata65 <- fromJSON(paste0(baseurl, "&page=65"), flatten = TRUE)
mydata66 <- fromJSON(paste0(baseurl, "&page=66"), flatten = TRUE)
mydata67 <- fromJSON(paste0(baseurl, "&page=67"), flatten = TRUE)



#Juntar todas las paginas en un solo archivo

datoslobby <- rbind_pages(
  list(mydata0$data, mydata1$data, mydata2$data, mydata3$data, mydata4$data, mydata5$data,mydata6$data,mydata7$data,mydata8$data,mydata9$data,mydata10$data,
       mydata11$data, mydata12$data, mydata13$data, mydata14$data, mydata15$data,mydata16$data,mydata17$data,mydata18$data,mydata19$data,mydata20$data,
       mydata21$data, mydata22$data, mydata23$data, mydata24$data, mydata25$data,mydata26$data,mydata27$data,mydata28$data,mydata29$data,mydata30$data,
       mydata31$data, mydata32$data, mydata33$data, mydata34$data, mydata35$data,mydata36$data,mydata37$data,mydata38$data,mydata39$data,mydata40$data,
       mydata41$data, mydata42$data, mydata43$data, mydata44$data, mydata45$data,mydata46$data,mydata47$data,mydata48$data,mydata49$data,mydata50$data,
       mydata51$data, mydata52$data, mydata53$data, mydata54$data, mydata55$data,mydata56$data,mydata57$data,mydata58$data,mydata59$data,mydata60$data,
       mydata61$data, mydata62$data, mydata63$data, mydata64$data, mydata65$data,mydata66$data,mydata67$data)
)

#guardar
 write.csv(datoslobby, "/home/samuelrg/Descargas/datos_lobby.csv", row.names = FALSE)
