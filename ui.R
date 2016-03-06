#ui.R
library(shiny)
library(dplyr)
library(jsonlite) 


shinyUI(fluidPage(theme = "bootstrap.css",
  tags$head(
    tags$style(HTML("
      @import url(https://fonts.googleapis.com/css?family=Covered+By+Your+Grace);
              
      "))
    ), 
     
   headerPanel(
     h1("Youtube Mapping", align = "center",
          style = "font-family: 'Covered By Your Grace', cursive;
          font-weight: 100 ; line-height: 1.4;")),
        
   
    sidebarPanel(
      # Widget 1: Amount of results 
      sliderInput("bins", 
                  label = "Number amount of results listed", 
                  min = 1, max = 50, value = 15),
      br(), 
      # Widget 2: Radio Button for miles or kilometers 
      radioButtons("distance", 
                  label =  "Select miles or kilometers ", 
                  choices =c("Miles", "Kilometers"),
                  selected = "Miles")

      ),
    # Main Panel
    mainPanel(
      
      br(),
      # Panel Tabset
      tabsetPanel(type="tab", 
                  tabPanel("Map", plotOutput("you_map"))

      )
      
    )
    
  
  ) 
)

