#this cna be a place to put whatever scripts / test things that we may need to include in our porject

library(jsonlite)
library(shiny)
library(dplyr)
library(leaflet)
library(plotly)
library(stringr)

#youtube api dev key
key <- "AIzaSyAFot4QVTGFxQTMZB8_hUxIzOqQQ-WnxQI"

#base url for youtube api
base_url <- "https://www.googleapis.com/youtube/v3/videos"

#geolocation given in a csv format
location <- "29.7604,-95.3698" #csv's

#radius of the circle aroudn the location
radius <- "5km"

#the search that the user wants
search <- "meme memez" %>% 
  str_replace(" ", "+")

#number of results that are given
n <- 20 

url <- paste0("https://www.googleapis.com/youtube/v3/search?part=snippet", 
              "&location=", location,
              "&locationRadius=", radius,
              "&maxResults=", n,
              "&q=", search,
              "&type=video",
              "&fields=items",
              "&key=", key)
