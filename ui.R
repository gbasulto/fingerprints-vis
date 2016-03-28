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
      
      checkboxGroupInput("class", 
                         label = "Class", 
                         choices = c("Arch", "Left loop", "Right loop", 
                                     "Tented arch", "Whorl"), 
                         selected = c("Arch", "Left loop", "Right loop", 
                                      "Tented arch", "Whorl")),

      checkboxGroupInput("gender", 
                         label = "Gender", 
                         choices = c("Female", "Male"), 
                         selected = c("Male", "Female"))
    ),
    
    # Show a tabset that includes a plot, summary, and table view
    # of the generated distribution
    mainPanel(
      tabsetPanel(type = "tabs",
                  tabPanel("Description", includeMarkdown("description.md")), 
                  tabPanel("Image", plotOutput("image", width = 512, height = 512)), 
                  tabPanel("Pair", plotOutput("pair"))
      )
    )
  )
))
