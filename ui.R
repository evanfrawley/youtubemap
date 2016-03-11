library(shiny)
library(leaflet)
library(dplyr)
library(jsonlite)

shinyUI(fluidPage(
  #includeCSS("styles.css"),
  #includeHTML("index.html"),
    sidebarPanel(
      
      # Widge 1: Search
      textInput("search", label = h4("Search ID"),
                value = "Keywords..."),
      
      # Widget 2: Input Radius
      textInput("radius", label = h4("Input Radius"),
                value = "Input Radius..."),
      
      br(),
      # Widget 3: Amount of results 
      sliderInput("bins", 
                  label = "Number amount of results listed", 
                  min = 1, max = 50, value = 15),
      br(), 

      # Widget 4: Radio Button for miles or kilometers 
      radioButtons("units", 
                  label =  "Select miles or kilometers ", 
                  choices =c("Miles" = "mi", "Kilometers" = "km"),
                  selected = "mi")

      ),
    # Main Panel
    mainPanel(
      
      br(),
      # Panel Tabset
      tabsetPanel(type="tab", 
                  tabPanel("Map", leafletOutput("map")),
                  tabPanel("Popular Map", leafletOutput("popularmap")),
                  tabPanel("Graph", plotlyOutput("graph"))
      )
    )
  ) 
)
