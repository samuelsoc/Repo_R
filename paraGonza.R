#Recoleccion Estadisticas desde API Junar

#Intalar librerias

library(dplyr) #libreria para manipular dataframes
library(jsonlite) #libreria para leer json
library(ggplot2)
#objetos para  construir query

webcne <-"http://datos.energiaabierta.cl" #puedes poner la url de la web de cualquier cliente

#Query endpoint de la api

urlapi1 <- "http://cne.cloudapi.junar.com/api/v2/stats/?auth_key=50ec79952723047e1458e769a02a970a93eccdc5&from=01/10/2016&to=31/12/2016&format=json" 
# urlapi1 puede ser cualquier nombre, aqui le puse "urlapi1" para ordenar, 
# sera = al endpoint que le asigne siempre entre comillas

urlapi2 <-"http://cne.cloudapi.junar.com/api/v2/stats/?auth_key=50ec79952723047e1458e769a02a970a93eccdc5&from=01/01/2017&to=31/03/2017&format=json"
# idem anterior


urlapi3 <-"http://cne.cloudapi.junar.com/api/v2/stats/?auth_key=50ec79952723047e1458e769a02a970a93eccdc5&from=01/04/2017&to=30/06/2017&format=json"

urlapi4<- "http://cne.cloudapi.junar.com/api/v2/stats/?auth_key=50ec79952723047e1458e769a02a970a93eccdc5&from=01/07/2017&to=30/09/2017&format=json"


#Construcción llamada  a la API

  reqapi <- fromJSON(urlapi1) 
# aqui se hace la llamada al endpoint con fromJSON
# reqapi es = al resultado del endpoint


DFreq <- reqapi$datastreams$stats$resources 
# aqiu se entra a los elementos del json
# es la ruta a los datos, en este caso hit de las vistas
# si en la consolas de RStudio escribes View(DFreq)
# veras los datos como una tabla si editar


##Construcción tabla de datos##
#aqui se aplican funciones de la libreria dplyr

VistaDatos <-mutate(DFreq, URL = (paste0( webcne,DFreq$landingPage)) ) %>% 
  select('Cantidad_Visitas' = count,
         'Nombre_Vista' =title,
         'Descripción' = description,
         'URL Vista' = URL,
         'Categoria' = category,
         'GUID' = guid)

#ahora prueba con View(VistaDatos) en la consola y ve la diferencia

#para guardar el archivo indicale la ruta

write.csv(VistaDatos, "/home/samuelrg/JunarSamuel/urlapi1.csv", row.names = FALSE)



####PLOT###
#library("RColorBrewer")
#library("wesanderson") #wes_palettes # Listado completo de paletas


p1 <- ggplot(VistaDatos, aes(x=Nombre_Vista, y = Cantidad_Visitas, fill=Cantidad_Visitas)) + 
  geom_bar(stat = "identity") + 
  labs (x="Nombre Vista de Datos", y = "Cantidad de Hits") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
p1

##PLOT INTERACTIVO
library(reshape2)
library(rCharts)

M1 = mPlot(x = 'Nombre_Vista', y = 'Cantidad_Visitas',
           data = VistaDatos,
           color = 'Categoria',
           type = 'Bar')
M1$set(hideHover = "auto")
M1




###
