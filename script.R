


#this cna be a place to put whatever scripts / test things that we may need to include in our porject

library(jsonlite)
library(shiny)
library(dplyr)
library(leaflet)
library(plotly)

key <- "AIzaSyAFot4QVTGFxQTMZB8_hUxIzOqQQ-WnxQI"

base_url <- "https://www.googleapis.com/youtube/v3/videos"

location <- "29.7604,-95.3698"

radius <- "5km"

search <- "q"



url <- paste0("https://www.googleapis.com/youtube/v3/videos?part=snippet", 
              "&chart=mostRecent",
              "&location=", location,
              "&locationRadius=", radius,
              "&maxResults=1",
              "&fields=items", "&key=", key)
  