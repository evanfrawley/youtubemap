#server.R

library(shiny)
library(leaflet)
library(dplyr)
library(jsonlite)

source("buildmap.R")
source("script.R")

shinyServer(function(input, output) {
  
  output$map <- renderLeaflet({
    
    build()
    
  })
  
  ouput$vid_data <- eventReactive(input$map_click, {
    location <- input$map_click
    radius <- input$radius
    units <- input$units
    n <- input$bins
    search <- input$search
    get_data(location,
             radius, units,
             n,
             search)
  })
})