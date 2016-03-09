library(shiny)
library(dplyr)
library(plotly)

#source('bar_graph.R')
data <- read.csv(file = "sample.csv", TRUE, sep = ",")
shinyServer(function(input, output) {
  # Reactive expression to compose a data frame containing 
  # certain information
  datasetInput <- reactive({
    switch(input$checkGroup,
           1 == views,
           2 == likes,
           3 == dislikes)
  })
  
  # Output bargraph 
  output$bargraph <- renderPlotly({
    #data <- read.csv(file = "sample.csv", TRUE, sep = ",")
    plot_ly(data, 
            x = head(video,input$bins), 
            y = datasetInput(), 
            type = "bar", 
            marker = list(color = 'orange'),
            name = "Views") %>% 
      layout(title = "Statistics on top videos in region",
             xaxis = list(title = "Youtube Videos"),
             yaxis = list(title = "Count")) %>%
      add_trace(y = datasetInput(), marker = list(color = 'green'), name = "Likes")
    #input$checkGroup
  })
  
  
  
})