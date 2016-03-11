#this cna be a place to put whatever scripts / test things that we may need to include in our porject

library(jsonlite)
library(shiny)
library(dplyr)
library(leaflet)
library(plotly)
library(stringr)

###############################
# MAP STUFF
############################### 
  

build <- function(){
  m <- leaflet() %>% 
    addTiles() %>% 
    setView(lng = -96, lat = 38.8833, zoom = 4) %>% 
  return()
}


