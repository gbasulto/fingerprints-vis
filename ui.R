library(png)
library(magrittr)
library(stringr)
library(plyr)
library(ggplot2)
library(dplyr)
library(tidyr)
library(fingerprints)
library(shiny)

# Define UI for random distribution application 
shinyUI(fluidPage(
    
  # Application title
  titlePanel("Fingerprints"),
  
  # Sidebar with controls to select the random distribution type
  # and number of observations to generate. Note the use of the
  # br() element to introduce extra vertical spacing
  sidebarLayout(
    sidebarPanel(
      
      actionButton("sample_button", label = "Click here for new sample"),
      
      br(),
      
      radioButtons("pattern", "Pattern", c("Male", "Female", "Both")),
      
      radioButtons("gender", "Gender", c("Male", "Female", "Both")),
      
      sliderInput("n", 
                  "Number of observations:", 
                   value = 500,
                   min = 1, 
                   max = 1000)
    ),
    
    # Show a tabset that includes a plot, summary, and table view
    # of the generated distribution
    mainPanel(
      tabsetPanel(type = "tabs", 
                  tabPanel("Image", plotOutput("image", width = 512, height = 512)), 
                  tabPanel("Pair", plotOutput("pair"))
      )
    )
  )
))
