#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(HistData)


data(Galton)

modelFit <- lm(Galton$child ~ Galton$parent)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
       
        mp <- reactive((input$f_ht + (input$m_ht * 1.08)) /2)
        output$oid2 <- renderText(mp())
        #output$o_f_ht <- renderPrint({input$f_ht}) 
        #output$o_m_ht <- renderPrint({input$m_ht}) 
    
   
        childHeight <- reactive({ 
        if (input$select == 1)
              modelFit$coeff[1] + modelFit$coeff[2] * mp()
        else
              (modelFit$coeff[1] + modelFit$coeff[2] * mp()) / 1.08
       })
         
       output$ochild <- renderText(childHeight()) 
   
})
