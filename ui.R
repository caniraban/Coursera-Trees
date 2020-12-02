#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Predict Height of Trees using Girth"),
    
    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("sliderGirth", "What is the Girth of the tree?", min = 8, max = 25, value = 15),
            checkboxInput("showmodel", "Show/Hide Model", value = TRUE),
            submitButton("Submit"), 
        ),
        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("plot"),
            h3 ("Predict Height of tree:"),
            textOutput("pred"),
            
        )
    )
))
