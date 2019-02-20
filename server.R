library(shiny)
shinyServer(function(input, output) {
  output$plot1 <- renderPlot({ par(bg = "lightblue", fg = "blue", col = "red")
    set.seed(1337)
    numberpoints <- input$numeric
    minx <- input$xslider[1]
    maxx <- input$xslider[2]
    miny <- input$yslider[1]
    maxy <- input$yslider[2]
    datax <- runif(numberpoints, minx, maxx)
    datay <- runif(numberpoints, miny, maxy)
    plot(datax, datay, xlab = " random number on x axis", ylab = " random number on y axis", main = "Random numbers generated",
         xlim = c(-1337, 1337), ylim = c(-1337, 1337))
  })

  })