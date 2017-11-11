getstats.R

#Stats from resources


#base_url = http://pilar.cloudapi.junar.com/api/v2/stats/
#api_key = ac0d7fc2804b535637ae44aa5f0bc57c674d3353

 base_url = "http://pilar.cloudapi.junar.com/api/v2/stats/"
 api_key = "ac0d7fc2804b535637ae44aa5f0bc57c674d3353"
    

  
  #Hits to datastream
 get_statsDS <- function(base_url, api_key){
   if (missing(base_url)) {
     warning("Please add a valid base URL")
   } else if (missing(api_key)) {
     warning("Please add a valid API key for the base URL you are trying to access")
   } else
     try({
       r <- GET(paste(base_url, "?auth_key=", api_key, sep=""), accept_json())
       dataset <- fromJSON(content(r, "text"))
       dataset <- dataset$datastream$stats$resources
       df <- as.data.frame(dataset)
       colnames(df) <- dataset[1,]
       df <- df [-1,]   
       return(dataset)
     })
 }
  
  get_statsDS(base_url, api_key)


  # Hits to Visualizations
   get_statsVZ <- function(base_url, api_key){
   if (missing(base_url)) {
     warning("Please add a valid base URL")
   } else if (missing(api_key)) {
     warning("Please add a valid API key for the base URL you are trying to access")
   } else
     try({
       r <- GET(paste(base_url, "?auth_key=", api_key, sep=""), accept_json())
       dataset <- fromJSON(content(r, "text"))
       dataset <- dataset$visualizations$stats$resources
       df <- as.data.frame(dataset)
       colnames(df) <- dataset[1,]
       df <- df [-1,]   
       return(dataset)
     })
 }
  

  #Hits to Dashboards
   get_statsDB <- function(base_url, api_key){
   if (missing(base_url)) {
     warning("Please add a valid base URL")
   } else if (missing(api_key)) {
     warning("Please add a valid API key for the base URL you are trying to access")
   } else
     try({
       r <- GET(paste(base_url, "?auth_key=", api_key, sep=""), accept_json())
       dataset <- fromJSON(content(r, "text"))
       dataset <- dataset$dashboards$stats$resources
       df <- as.data.frame(dataset)
       colnames(df) <- dataset[1,]
       df <- df [-1,]   
       return(dataset)
     })
 }
  