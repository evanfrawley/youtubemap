#this cna be a place to put whatever scripts / test things that we may need to include in our porject

library(jsonlite)
library(shiny)
library(dplyr)
library(stringr)

source("data.r")


###############################
# YOUTUBE API STUFF
###############################


#location <- "47.6550,-122.3080"
#radius <- "5"
#units <- "mi"
#n <-5
#search <- "hi"

get_data <- function(location, radius, units, n, search) {
  
  key <- "AIzaSyAFot4QVTGFxQTMZB8_hUxIzOqQQ-WnxQI"
  url <- paste0(
    "https://www.googleapis.com/youtube/v3/search",
    "?part=snippet",
    "&location=", location,
    "&locationRadius=", radius, units,
    "&maxResults=", n,
    "&q=", search,
    "&type=video&fields=items",
    "&key=", key
  )
  
  print(url)
  
  data <- fromJSON(url)
  data <- data$items %>% 
    as.data.frame()
    
  ids <- data$id$videoId
  names <- data$snippet$title
  views <- lapply(ids, getViewCount) %>% 
    unlist()
  likes <- lapply(ids, getLikeCount) %>% 
    unlist()
  dislikes <- lapply(ids, getDislikeCount) %>% 
    unlist()
  

  new <- as.data.frame(cbind(names, views, likes, dislikes)) %>% 
    return()
}

testing <- get_data("47.6550,-122.3080", "5", "mi", 5, "hi")

