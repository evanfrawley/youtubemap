#server.R

library(shiny)
library(leaflet)
library(dplyr)
library(jsonlite)
library(plotly)

source("buildmap.R")
source("script.R")

shinyServer(function(input, output) {
  
  output$map <- renderLeaflet({
    
    build()
    
  })
  



  #data$id$videoId gets vid id
  #data$snippet$title gets title fo the video
  
  
  output$graph <- renderPlotly({
    
    temp <- input$map_click 
    location <- paste0(temp[[1]], ",", temp[[2]])

    radius <- input$radius
    units <- input$units
    n <- input$bins
    search <- input$search
    
    df <- get_data(location,
             radius, units,
             n,
             search)

  
    plot_ly(df, 
            x = head(name, input$bins), 
            y = views, 
            type = "bar", 
            marker = list(color = 'orange'),
            name = "Views") %>% 
      layout(title = "Statistics on top videos in region",
             xaxis = list(title = "Youtube Videos"),
             yaxis = list(title = "Count")) %>%
      add_trace(y = likes, marker = list(color = 'green'), name = "Likes") %>% 
      add_trace(y = dislikes, marker = list(color = 'red'), name = "Dislikes") 
    
    
  })
  
  
  
})