#Builds a map of the most popular videos

library(jsonlite)
library(shiny)
library(dplyr)
library(leaflet)
library(plotly)
library(stringr)

source("script.R")
source("data.r")

key <- "AIzaSyAFot4QVTGFxQTMZB8_hUxIzOqQQ-WnxQI"

getURL <- function(videoID) {
  return(paste0("https://www.youtube.com/watch?v=", videoID))
}

###############################
# MAP STUFF
###############################

#Function will build a map showing where the most popular videos were posted.
buildMostPopular <- function(){
  url <- paste0("https://www.googleapis.com/youtube/v3/videos?part=snippet",
                  "%2CrecordingDetails&chart=mostPopular&maxResults=50&key=", key)
  data <- flatten(fromJSON(url)$items)
  locationData <- na.omit(data.frame(lat = data$recordingDetails.location.latitude, 
                             lng = data$recordingDetails.location.longitude,
                             hover = data$snippet.title,
                             url = getURL(data$id)
                             ))
  m <- leaflet(locationData) %>% 
    addTiles() %>% 
    addMarkers(popup = paste0(locationData$hover, " Watch Here!: ", locationData$url)) %>%
    return()
}


