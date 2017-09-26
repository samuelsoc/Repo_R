#Mapas Datos San Fernando, para NAcho

library(dplyr)
library(ggmap)

#Limpieza y geocodificación




#Base de datos

DSF <-read.csv("/home/samuelrg/Dropbox/Proyectos R/coordenadasSanFErnando.csv", sep = ",", stringsAsFactors = FALSE)
dsf <- data.frame(DSF)

# columnas de coordenadas deben ser numericas
dsf$latitud <- as.numeric(as.character(dsf$latitud))
dsf$longitud <- as.numeric(as.character(dsf$longitud))










#MAPAS

#mapa1 puntos
ciudad5 <- get_map("San Fernando Chile", zoom=11)
p     <- ggmap(ciudad5)
p + geom_point(data = dsf, 
               aes(x = longitud, y = latitud), 
               color = "blue", 
               size  = 2, 
               alpha = 0.5)

#mapa2 de calor
ciudad6 <- get_map("Ssssan Fernando, Chile", zoom=13)
p      <- ggmap(ciudad6)
p      <- p+stat_density2d(aes(x = longitud, y = latitud, fill=..level..), 
                           data=dsf,geom="polygon", alpha=0.2)
p + scale_fill_gradient(low = "green", high = "blue")
