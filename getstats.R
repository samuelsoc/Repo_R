getstats.R

library(httr)
library(jsonlite)
library(dplyr)

#Stats from resources


#base_url = http://pilar.cloudapi.junar.com/api/v2/stats/
#api_key = ac0d7fc2804b535637ae44aa5f0bc57c674d3353
#from = 1/1/2017
#to = 30/11/2017
#month = month

 base_url = "http://pilar.cloudapi.junar.com/api/v2/stats/"
 api_key = "ac0d7fc2804b535637ae44aa5f0bc57c674d3353"

 from = "1/1/2017"
 to = "30/11/2017"
 month = "month"

    

  
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
  

#HITS BY DATE

  #Hits to datastream_date
   get_statsDS_Date <- function(base_url, api_key, from, to){
     if (missing(base_url)) {
       warning("Please add a valid base URL")
     } else if (missing(api_key)) {
       warning("Please add a valid API key for the base URL you are trying to access")
     } else if (missing (from)) {
       warning("Please add a valid Date format dd/mm/yyyy")
     } else if (missing(to)) {
       warning("Please add a valid Date format dd/mm/yyyy")
     }
     try({
       r <- GET(paste(base_url, "?auth_key=", api_key, "&from=", from, "&to=", to, sep=""), accept_json())
       dataset <- fromJSON(content(r, "text"))
       dataset <- dataset$datastream$stats$resources
       df <- as.data.frame(dataset)
       colnames(df) <- dataset[1,]
       df <- df [-1,]   
       return(dataset)
     })
   }
  
  get_statsDS_Date(base_url, api_key, from, to)
  
  
  #Hits GroupByMonth
  
  get_statsDS_Month <- function(base_url, api_key, month){
    if (missing(base_url)) {
      warning("Please add a valid base URL")
    } else if (missing(api_key)) {
      warning("Please add a valid API key for the base URL you are trying to access")
    } 
    try({
      r <- GET(paste(base_url, "?auth_key=", api_key, "&group_by=", month, sep=""), accept_json())
      dataset <- fromJSON(content(r, "text"))
      dataset <- dataset$datastreams$stats$articles_over_time
      df <- as.data.frame(dataset)
      colnames(df) <- dataset[1,]
      df <- df [-1,]   
      return(dataset)
    })
  }

  get_statsDS_Month(base_url,api_key, month)


