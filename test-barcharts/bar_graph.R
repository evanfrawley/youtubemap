library(plotly)
library(manipulate)
library(ggplot2)

setwd("/Users/julieeng/Documents/info498f/test-youtube-map/")
# Create new data frame depending on what data user wants to see
data <- read.csv(file = "sample.csv", TRUE, sep = ",")


plot_ly(data, 
        x = video, 
        y = views, 
        type = "bar", 
        marker = list(color = 'orange'),
        name = "Views") %>% 
  layout(title = "Statistics on top videos in region",
         xaxis = list(title = "Youtube Videos"),
         yaxis = list(title = "Count")) %>% 
  add_trace(y = likes, marker = list(color = 'green'), name = "Likes") %>%
  add_trace(y = dislikes, marker = list(color = 'red'), name = "Dislikes") 

 
  

