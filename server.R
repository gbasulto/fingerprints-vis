library(shiny)

## Set directory
db_dirr <- paste0("./../NISTSpecialDatabase4GrayScaleImagesofFIGS/",
                  "sd04/png_txt/")

## Load database
info <- extract_info_df(db_dirr)



# Define server logic for random distribution application
shinyServer(function(input, output) {
  
  # Reactive expression to generate the requested distribution.
  # This is called whenever the inputs change. The output
  # functions defined below then all use the value computed from
  # this expression
  data <- reactive({
    dist <- switch(input$dist,
                   norm = rnorm,
                   unif = runif,
                   lnorm = rlnorm,
                   exp = rexp,
                   rnorm)
    
    dist(input$n)
  })
  
  reactive_image <- eventReactive(input$sample_button, {
    sample_image(db_dirr, info, Class = "L", Gender = "M") %>%
      display_image()
  })
  
  reactive_pair <- eventReactive(input$sample_button, {
    sample_pair(db_dirr, info, Class = "L", Gender = "M") %>%
      display_pair()
  })
  
  output$image <- renderPlot({
    reactive_image()
  })

  output$pair <- renderPlot({
    reactive_pair()
  })
    
})
