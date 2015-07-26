
#
# Using the selected values of
# the weight of the vehicle in tons
# and the number of vehicle cylinders
# we create our prediction model.
#

library(shiny)

library(ggplot2)


shinyServer(function(input, output) {
  
  # Use shiny's reactive machinery
  predicted.mpg <- reactive({
    
    # Create the model
    model <- lm(mpg ~ cyl + wt, data=mtcars)
    
    # Use the model
    pre <- predict(model, newdata=data.frame(cyl=input$cyl, wt=input$wt))
    
    # Return the prediction
    return(pre[1])    
  })
  
  # Format the result of the prediction
  output$mpg <- renderText(sprintf('Result of the prediction: %.1f mpg',predicted.mpg()))
  
  # Render the plot
  output$predictionPlot <- renderPlot({
    
    # Start with a copy of mtcars data set
    zcars <- mtcars
    
    zcars$from = 'Motor Trend data set'
    
    # Create the user's car
    new.car <- data.frame(
      mpg = predicted.mpg(),
      cyl = input$cyl,
      disp = 1,
      hp = 1,
      drat = 1,
      wt = input$wt,
      qsec = 1,
      vs = 1,
      am = 1,
      gear = 1,
      carb = 1,
      from = 'Prediction'
    )
    
    # Append the car
    zcars <- rbind(zcars, new.car)
    rownames(zcars)[nrow(zcars)] <- "user"
    
    # Highlight the user's car and prediction
    xfactor <- (max(zcars$wt) - min(zcars$wt)) * 0.025
    yfactor <- (max(zcars$cyl) - min(zcars$cyl)) * 0.25
    
    zcars$cyl <- as.factor(zcars$cyl)
    
    # Plot the prediction
    pre <- ggplot(zcars, aes(x=wt, y=mpg, color=cyl, shape=from)) +
      annotate('rect',
               xmin=new.car$wt-xfactor, ymin=new.car$mpg-yfactor,
               xmax=new.car$wt+xfactor, ymax=new.car$mpg+yfactor,
               alpha=0.3,
               fill='yellow') +
      geom_point(size=4, alpha=0.8) +
      xlab('Vehicle weight (tons)') +
      ylab('Miles per gallon (mpg)') +
      ggtitle('Mileage Predictor\n') +
      theme_bw()
    
      print(pre)
  })
  
})