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