library(shiny)

shinyUI(fluidPage(
  # Title Panel
  titlePanel("Youtube Map"),
  # Declare sidebar layout
  sidebarLayout(
    # Put sidebar widgets here
    sidebarPanel(
      helpText("These side bar widgets will be used to view statistics on the videos"),
      # Widget 1: Checkbox group to see selected statistics on bar graph
      checkboxGroupInput("checkGroup", "Check any of the following to view statistics", 
                         choices = list("Views" = "views", 
                                     "Likes" = "likes", 
                                     "Dislikes" = "dislikes"),
                         selected = "views"),
      br(),
      # Widget 2: Number of videos the user wants to show
      sliderInput("bins", "Number of videos you'd like to see statistics on:", 
                  min = 1, max = 50, value = 25, step = 1)
    ),
    
    # Show a tabset that includes a map and bar graph
    mainPanel(
      tabsetPanel(type = "tabs", 
                  tabPanel("Bar graph", plotlyOutput("bargraph")))
    )
  )
))
