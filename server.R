#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(UsingR)

shinyServer(function(input, output) {
        
        model1 <- lm(sheight ~ fheight, data = UsingR::father.son)
        model1pred <- reactive({
                HTInput <- input$sliderHT
                predict(model1, newdata = data.frame(fheight = HTInput))
        })     
        output$instructions <- renderText({
              print("Use the slider bar to the left to select a height in inches of a father's height. The resulting son's height is represented on the graph below by the blue dot and the value is displayed below the graph. By checking the box to the left, you may show or hide the red line that depicts the best fit line containing son's mean height based on a father's height. This application uses the father.son dataset from the UsingR package.")
        })
        output$plot1 <- renderPlot({
                HTInput <- input$sliderHT
                plot(father.son$fheight, father.son$sheight, xlab = "Father's Height", 
                     ylab = "Son's Height", xlim = c(55, 80), ylim = c(50, 80))
                points(HTInput, model1pred(), col = "blue", pch = 16, cex = 2)
                if(input$showModel1){
                        abline(model1, col = "red", lwd = 2)
                }
        })
        
        output$pred1 <- renderText({
                h = format(model1pred(), digits = 3)
                sprintf("The son's height is %s inches.", h)
        })
})