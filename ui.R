library(shinydashboard)
library(shiny)

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
                 selected = "Miles")
  )

# Tabs to select map, bar chart or list of results. Shows statistics like views, 
# likes and dislikes 
  body <- dashboardBody(
    tags$head(tags$style(HTML('
          .main-header .logo {
                              font-family: "Rancho";
                              font-style: normal;
                              font-weight: 400;
                              src: local("Rancho"), url(https://fonts.gstatic.com/s/rancho/v6/yJONObwbYmkcfKME0p1HqevvDin1pK8aKteLpeZ5c0A.woff2) format("woff2");
                              unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2212, U+2215, U+E0FF, U+EFFD, U+F000;
                              }
                              .font-effect-shadow-multiple {
                              text-shadow: .04em .04em 0 #fff,.08em .08em 0 #aaa;
                              -webkit-text-shadow: .04em .04em 0 #fff, .08em .08em 0 #aaa;
                              }
                
                              }
                              '))),
    
    fluidRow(
      tabBox(
        id = "tabset1", width = "100px", height = "500px",
        tabPanel("Interactive Map"),
        tabPanel("Bar Chart"),
        tabPanel("List of Results")
      ),
      
      # Views statistic 
      infoBox("Views", icon = icon("television"), color = 'teal', fill = TRUE),
      
      # Likes statistic
      infoBox("Likes", icon = icon("thumbs-up"), color = 'red', fill = TRUE),
      
      # Dislikes
      infoBox("Dislikes", icon = icon("thumbs-down"), fill = TRUE)
      
  )
  )
  
  dashboardPage(skin = "black",
    dashboardHeader(title = "YOUTUBE MAP"),
    sidebar,
    body
  )
