#setwd("C:/Users/auke.beeksma/Desktop/Developing dataproducts in R/Courseproject Shiny app and presentation/Courseproject")

library(markdown)
library(shiny)

shinyUI(navbarPage("Random number generator",
                   tabPanel("Random numbers",
  
  sidebarLayout(
    sidebarPanel(
      helpText("Give the number of random numbers to be plotted and adjust the axis "),
      numericInput("numeric", "How many random numbers should be plotted?",
                   value = 1337, min = 0, max = 1337, step = 1),
      sliderInput("xslider", "Pick a minimum and maximum number for the x-axis between -1337 and 1337 if you like",
                  -1337, 1337, value = c(-137, 137)),
      sliderInput("yslider", "Pick a minimum and maximum number for the y-axis between -1337 and 1337 if you like",
                  -1337, 1337, value = c(-137, 137)),
      submitButton("Press please")
    ),
    
    mainPanel(
      h4("Your own random generated numbers"),
      plotOutput("plot1")
    )
  )
),

tabPanel("About random numbers",
         mainPanel(
           includeMarkdown("about")
           )) 
) 
) 
         
       
     