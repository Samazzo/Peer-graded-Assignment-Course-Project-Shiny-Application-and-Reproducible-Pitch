server <- function(input, output) {
  filtered <- reactive({
    if (is.null(input$countryInput)) {
      return(NULL)
    }  
    bcl %>%
      filter(Price >= input$priceInput[1],
             Price <= input$priceInput[2],
             Type == input$typeInput,
             Country == input$countryInput
      )
  })
  
  output$coolplot <- renderPlot({
    if (is.null(filtered())) {
      return()
    }
    
    ggplot(filtered(), aes(Alcohol_Content)) +
      geom_histogram(fill = "blue") + 
      theme(plot.background = element_rect(color = "yellow", fill = "pink", size = 6)) 
  })
  
  output$countryOutput <- renderUI({
    selectInput("countryInput", "Country",
                sort(unique(bcl$Country)),
                selected = "AUSTRALIA")
  })
  
  output$results <- renderTable({
    filtered()
  })
}