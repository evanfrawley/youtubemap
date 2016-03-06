#this cna be a place to put whatever scripts / test things that we may need to include in our porject\

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
