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

data <- fromJSON(paste0("https://www.googleapis.com/youtube/analytics/v1/reports",
                        "&key=", key,
                        "&start-date=2016-02-10",
                        "&end-date=2016-02-20",
                        "&id=Kpoo6M3S9E8",
                        "&metrics=views"))

data <- fromJSON(paste0("https://www.googleapis.com/youtube/v3/videos?part=statistics&id=Kpoo6M3S9E8",
              "&key=", key, "&start-date=2016-02-20&end-date=2016-02-25"))

url <- paste0("https://www.googleapis.com/youtube/v3/videos?part=snippet", 
              "&chart=mostPopular",
              "&location=", location,
              "&locationRadius=", radius,
              "&maxResults=1",
              "&fields=items", "&key=", key)


data <- read.csv <- (url)
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
