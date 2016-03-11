library(shinydashboard)
library(shiny)
library(leaflet)
library(dplyr)
library(jsonlite)
library(plotly)


# Widgets to allow users to input their search query, select the amount of results
# shown, select the distance in radius and mi/km 

  sidebar <- dashboardSidebar( 
  
        # Widget #1: Search
      sidebarSearchForm(textId = "Search", buttonId = "search",
                        label = "Search..."),
      
      # Widget #2: Select amount of results 
      sliderInput("bins", "Amount of Results Display", 1, 50, 25),
  
      br(),
      
      # Widget #3: Select the radius
      sliderInput("radius", "Select the radius", 1, 50, 25),
      
      br(), 
      
      # Widget #4: Select miles or kilometers
      radioButtons("units", "Select miles or kilometers", 
                   choices = c("Miles" = "mi", "Kilometers" = "km"),
                   selected = "mi")
    )

  # Tabs to select map, bar chart or list of results. Shows statistics like views, 
  # likes and dislikes 
    body <- dashboardBody(

      fluidRow(
        box(
          title = strong("About Youtube Map"), width = 12, background = "light-blue",
          "The purpose of this application is to show users what youtube videos are being 
          posted in what areas of the world. We offer three key features to explore various 
          questions about data on youtube videos"),
        
        box(
          title = strong("Map"), width = 4, background = "teal",
          "A user can click on any locaton and see statistics on the videos that were posted in that area"),
        
        box(
          title = strong("Graph"), width = 4, background = "yellow",
          "A user can see the statistics on the top videos of the region the user clicked in the map tab."),

        box(
          title = strong("Popular Map"), width = 4, background = "red",
          "A user can view where some of the most popular videos in the world were posted."),
      
        
        tabsetPanel(
          id = "tabset1", width = "100px", height = "500px",
          tabPanel("Map", leafletOutput("map")),
          tabPanel("Popular Map", leafletOutput("popularmap")),
          tabPanel("Graph", plotlyOutput("graph"))
        )
        
        
    )
    )
    dashboardPage(skin = "black",
                  dashboardHeader(title = "YOUTUBE MAP"),
                  sidebar,
                  body
    )


  


