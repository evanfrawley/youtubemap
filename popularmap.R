#Builds a map of the most popular videos

library(jsonlite)
library(shiny)
library(dplyr)
library(leaflet)
library(plotly)
library(stringr)

source("script.R")
source("data.r")

###############################
# MAP STUFF
###############################

#Function will build a map showing where the most popular videos were posted.
buildMostPopular <- function(){
  
  getURL <- function(videoID) {
    return(paste0("https://www.youtube.com/watch?v=", videoID))
  }
  
  key <- "AIzaSyAFot4QVTGFxQTMZB8_hUxIzOqQQ-WnxQI"
  
  url <- paste0("https://www.googleapis.com/youtube/v3/videos?part=snippet",
                  "%2CrecordingDetails&chart=mostPopular&maxResults=50&key=", key)
  url2 <- paste0("https://www.googleapis.com/youtube/v3/videos?part=snippet%2",
                "CrecordingDetails&chart=mostPopular&maxResults=50&pageToken=CBkQAA&key=", key)
  url3 <- paste0("https://www.googleapis.com/youtube/v3/videos?part=snippet%2",
                 "CrecordingDetails&chart=mostPopular&maxResults=50&pageToken=CDIQAA&key=", key)
  url4 <- paste0("https://www.googleapis.com/youtube/v3/videos?part=snippet%2",
                 "CrecordingDetails&chart=mostPopular&maxResults=50&pageToken=CGQQAA&key=", key)
  url5 <- paste0("https://www.googleapis.com/youtube/v3/videos?part=snippet%2",
                 "CrecordingDetails&chart=mostPopular&maxResults=50&pageToken=CJYBEAA&key=", key)
  
  ##Gathering the data sets using the youtube api
  data <- flatten(fromJSON(url)$items)
  data2 <- flatten(fromJSON(url2)$items)
  data3 <- flatten(fromJSON(url3)$items)
  data4 <- flatten(fromJSON(url4)$items)
  data5 <- flatten(fromJSON(url5)$items)

  
  ##Forming the Data Frames from each of teh data sets
  locationData <- na.omit(data.frame(lat = data$recordingDetails.location.latitude, 
                             lng = data$recordingDetails.location.longitude,
                             hover = data$snippet.title,
                             url = paste0("<a href=", (data$id), ">Watch Video</a>")
                             ))
  locationData2 <- na.omit(data.frame(lat = data2$recordingDetails.location.latitude, 
                                     lng = data2$recordingDetails.location.longitude,
                                     hover = data2$snippet.title,
                                     url = paste0("<a href=", getURL(data2$id), ">Watch Video</a>")
                                      ))
  locationData3 <- na.omit(data.frame(lat = data3$recordingDetails.location.latitude, 
                                     lng = data3$recordingDetails.location.longitude,
                                     hover = data3$snippet.title,
                                     url = paste0("<a href=", getURL(data3$id), ">Watch Video</a>")
  ))
  locationData4 <- na.omit(data.frame(lat = data4$recordingDetails.location.latitude, 
                                     lng = data4$recordingDetails.location.longitude,
                                     hover = data4$snippet.title,
                                     url = paste0("<a href=", getURL(data4$id), ">Watch Video</a>")
  ))
  locationData5 <- na.omit(data.frame(lat = data5$recordingDetails.location.latitude, 
                                     lng = data5$recordingDetails.location.longitude,
                                     hover = data5$snippet.title,
                                     url = paste0("<a href=", getURL(data5$id), ">Watch Video</a>")
  ))

  
  ##Combining the above data frames
  locationData <- rbind(locationData, locationData2, locationData3, locationData4, locationData5)
  
  ##Building the Final Map
  m <- leaflet(locationData) %>% 
    addTiles() %>% 
    addMarkers(popup = paste0(locationData$hover, "<br/>", locationData$url)) %>%
    return()
}


