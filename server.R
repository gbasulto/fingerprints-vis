library(shiny)

## Set directory
db_dirr <- paste0("./../NISTSpecialDatabase4GrayScaleImagesofFIGS/",
                  "sd04/png_txt/")

## Load database
info <- extract_info_df(db_dirr)



# Define server logic for random distribution application
shinyServer(function(input, output) {
  
  class <- reactive({
    clss <- 
      input$class %>%
      {gsub("Arch", "A", .)} %>%
      {gsub("Left loop", "L", .)} %>%
      {gsub("Right loop", "R", .)} %>%
      {gsub("Tented arch", "T", .)} %>%
      {gsub("Whorl", "W", .)}

    if(length(clss) == 0) stop("Must select at least one class.")
    
    return(clss)
  })
  
  gender <- reactive({
    gndr <- 
      gsub("Male", "M", input$gender) %>%
      {gsub("Female", "F", .)}
    if(length(gndr) == 0) stop("Must select at least one gender.")
    return(gndr)
  })
  
  reactive_image <- eventReactive(input$sample_button, {
    sample_image(db_dirr, info, Class = class(), Gender = gender()) %>%
      display_image()
  })
  
  reactive_pair <- eventReactive(input$sample_button, {
    sample_pair(db_dirr, info, Class = class(), Gender = gender()) %>%
      display_pair()
  })
  
  output$image <- renderPlot({
    reactive_image()
  })

  output$pair <- renderPlot({
    reactive_pair()
  })
    
})
