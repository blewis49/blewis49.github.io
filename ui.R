#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(fluidPage(
        titlePanel("Predict Son's Height from Father's Height"),
        sidebarLayout(
                sidebarPanel(
                        sliderInput("sliderHT", "What is the Father's Height in inches?", 
                                    60, 84, value = 65),
                        checkboxInput("showModel1", "Show/Hide Model Fit", value = TRUE)
                        
                ),
                mainPanel(
                        plotOutput("plot1"),
                        h3("Predicted Son's Height from Model:"),
                        textOutput("pred1")
                )
        )
))