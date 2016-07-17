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
  h4("Instructions:"),
  h6("Predict child's height by adjusting the sliders to enter Father's and Mother's heights."),
  h6("Use Dropdown to enter Child's sex.\n\n"),
  h6("Mid-Parent height is used to calc child's height. It is Father's ht. + (Mother's ht * 1.08)"),
  
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      
      sliderInput("f_ht",
                   "Father's Height:",
                   min = 56,
                   max = 80,
                   value = 70),
      sliderInput("m_ht",
                  "Mother's Height:",
                  min = 56,
                  max = 80,
                  value = 64),
      selectInput("select", label = h3("Child's Sex"), 
                  choices = list("Male" = 1, "Female" = 2), 
                  selected = 1)
      
     
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h3('Results'),
      
      h4("Mid-Parent Height"),
      verbatimTextOutput("oid2"),
      h4('Predicted Child Height'),
      verbatimTextOutput("ochild")
      
    )
  )
))
