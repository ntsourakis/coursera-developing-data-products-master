#
# Using the standard Motor Trends data set
# we have created a predictor of gas consumption
# calculated in miles per gallon (mpg).
#
# The model utilizes the weight of the vehicle in tons
# and the number of vehicle cylinders.
#

library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Predictor of gas consumption in miles per gallon (mpg)"),
  
  # Define the sidebar panel.
  # Include one slider for choosing the vehicle's weight in tons
  # and one slider for choosing the number of vehicle cylinders.
  sidebarLayout(
    sidebarPanel(
      
      p(
        
        "Using the standard Motor Trends data set",
        "we have created a predictor of gas consumption",
        "calculated in miles per gallon (mpg)."
      ),
      
      br(),
      
      p(
        "The model utilizes two factors:",
        "(1) the weight of the vehicle in tons",
        "and (2) the number of vehicle cylinders."
      ),
      
      br(),
      
      p(
        "Using the sliders below you can vary the values of these two factors.",
        "The result of our prediction model will appear below the sliders",
        "and graphically on the right."
      ),
      
      hr(),
      
      sliderInput("wt",
                  "Weight of vehicle in tons:",
                  min = 1,
                  max = 15,
                  value = 6),
      
      sliderInput("cyl",
                  "Number of vehicle cyclinders:",
                  min = 1,
                  max = 8,
                  value = 6),
      
      hr(),
      
      textOutput("mpg")
    ),
    
    # Show the plot from the prediction in the main panel
    mainPanel(
      plotOutput("predictionPlot")
    )
  )
))
