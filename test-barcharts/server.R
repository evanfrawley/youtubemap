library(shiny)
library(dplyr)
library(plotly)

data <- read.csv(file = "sample.csv", TRUE, sep = ",")
shinyServer(function(input, output) {
  
  # Output bargraph 
  output$bargraph <- renderPlotly({
    plot_ly(data, 
            x = head(video,input$bins), 
            y = views, 
            type = "bar", 
            marker = list(color = 'orange'),
            name = "Views") %>% 
      layout(title = "Statistics on top videos in region",
             xaxis = list(title = "Youtube Videos"),
             yaxis = list(title = "Count"))  %>%
      add_trace(y = likes, marker = list(color = 'green'), name = "Likes") %>% 
      add_trace(y = dislikes, marker = list(color = 'red'), name = "Dislikes") 
  })
  
  
  
})