#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    height <- lm(Height ~ Girth, data = trees)
    
    heightpred <- reactive({
        GirthInput <- input$sliderGirth
        predict(height, newdata = data.frame(Girth=GirthInput))
    })
    
        output$plot <- renderPlot({
        GirthInput <- input$sliderGirth
        plot(trees$Girth, trees$Height, xlab = "Girth of the tree",
             ylab = "Height of the tree", bty = "n", pch = 16, xlim = c(8,25), ylim = c(60,90))
        if(input$showmodel){
            abline (height, col = "red", lwd = 2)
        }
        points(GirthInput, heightpred(), col = "red", pch = 16, cex = 2)
    })
    output$pred <- renderText({
        heightpred()
    })
})
