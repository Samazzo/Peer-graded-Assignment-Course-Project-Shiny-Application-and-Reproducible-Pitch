setwd("C:/users/auke.beeksma/Desktop/Developing dataproducts in R/Courseproject Shiny app and presentation/Courseproject")
library(dplyr)
library(ggplot2)
library(readr)
library(shiny)
bcl <- read.csv("bcl-data.csv", stringsAsFactors = FALSE)

products <- c("BEER", "REFRESHMENT BEVERAGE", "SPIRITS", "WINE")
bcl <- dplyr::filter(bcl, PRODUCT_CLASS_NAME %in% products) %>%
  dplyr::select(-PRODUCT_TYPE_NAME, -PRODUCT_SKU_NO, -PRODUCT_BASE_UPC_NO,
                -PRODUCT_LITRES_PER_CONTAINER, -PRD_CONTAINER_PER_SELL_UNIT,
                -PRODUCT_SUB_CLASS_NAME) %>%
  rename(Type = PRODUCT_CLASS_NAME,
         Subtype = PRODUCT_MINOR_CLASS_NAME,
         Name = PRODUCT_LONG_NAME,
         Country = PRODUCT_COUNTRY_ORIGIN_NAME,
         Alcohol_Content = PRODUCT_ALCOHOL_PERCENT,
         Price = CURRENT_DISPLAY_PRICE,
         Sweetness = SWEETNESS_CODE)
bcl$Type <- sub("^REFRESHMENT BEVERAGE$", "REFRESHMENT", bcl$Type)

shinyUI(fluidPage(
  titlePanel("My app for Coursera"),
  h4("BC Liquor Store prices", style = "color: blue;"),
  " Using the BC Liquor data",
  br(),
  br(),
  br(),
  strong("Store", "prices"),
  strong(div("Alcoholic producttypes", style = "color: red;")),
  strong(div(em("Countries", style = "color: purple;"))),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("priceInput", "Price", min = 0, max = 100, value = c(0, 100), pre = "$"),
      radioButtons("typeInput", "Product type",
                   choices = c("BEER", "REFRESHMENT", "SPIRITS", "WINE"),
                   selected = "WINE"),
      uiOutput("countryOutput")
    ),
    mainPanel(
      plotOutput("coolplot"),
      br(), br(),
      tableOutput("results")
      
  )
)
))


