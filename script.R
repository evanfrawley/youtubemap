#this cna be a place to put whatever scripts / test things that we may need to include in our porject

library(jsonlite)
library(shiny)
library(dplyr)
library(stringr)

###############################
# YOUTUBE API STUFF
###############################

get_data <- function(location, radius, units, n, search){
  
  search <- search %>% 
    str_replace(" ", "+")
  base_url <- "https://www.googleapis.com/youtube/v3/search"
  key <- "AIzaSyAFot4QVTGFxQTMZB8_hUxIzOqQQ-WnxQI"
  
  url <- paste0(base_url,
                "?part=snippet", 
                "&location=", location,
                "&locationRadius=", radius, units,
                "&maxResults=", n,
                "&q=", search,
                "&type=video",
                "&fields=items",
                "&key=", key)
  
  data <- fromJSON(url) %>% 
    as.data.frame() %>% 
    
  return()
}
