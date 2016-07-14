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
  titlePanel("Predicting Child Heights Using Galton Data"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      #numericInput('id1', 'Father Height', 0, min = 50, max = 80, step = 1),
      #numericInput('id2', 'Mother Height', 0, min = 50, max = 80, step = 1),
      sliderInput("f_ht",
                   "Father's Height:",
                   min = 50,
                   max = 80,
                   value = 0),
      sliderInput("m_ht",
                  "Mother's Height:",
                  min = 50,
                  max = 80,
                  value = 0),
      selectInput("select", label = h3("Child's Sex"), 
                  choices = list("Male" = 1, "Female" = 2), 
                  selected = 1),
      
     
      submitButton('Submit')
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h3('Child Height Predictor Results'),
      #h4('You entered'),
      #verbatimTextOutput("oid1"),
      
      #h4("Father's Height"),
      #verbatimTextOutput("o_f_ht"),
      #h4("Mother's Height"),
      #verbatimTextOutput("o_m_ht"),
      h4("mid-parent height(Father's Height + (Mother's height * 1.08)/2)"),
      verbatimTextOutput("oid2"),
      h4('Predicted Child Height'),
      verbatimTextOutput("ochild")
    )
  )
))
