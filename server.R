library(shiny)
library(dplyr)
library(ggplot2)

# pick the variables for the prediction: MPG, WEIGHT, ACCELERATION SPEED AND TRANSMISSION TYPE
data <- mtcars[,c(1,6,7,9)]
data$am <- as.factor(data$am)
levels(data$am) <-c("Automatic", "Manual")
# str(data)
# str(mtcars)


# 
shinyServer(function(input, output) {
    output$distPlot <- renderPlot({
        # build the regression model
        fit <- lm( mpg~ ., data)
        pred <- predict(fit, newdata = data.frame(wt = input$wt,
                                                  am = input$am,
                                                  qsec = input$qsec))
        # plot the prediction
        plot <- ggplot(data=data, aes(x=wt, y = mpg))+
            geom_point(aes(color = am))+
            geom_smooth(method = "lm")+ 
            theme(legend.title=element_blank())
        
        plot
    })
    # dislay predicted value based off of user input on the side bar
    output$result <- renderText({
        fit <- lm( mpg~ ., data)
        pred <- predict(fit, newdata = data.frame(wt = input$wt,
                                                  am = input$am,
                                                  qsec = input$qsec))
        rslt <- paste(round(pred, digits = 1))
        rslt
    })
    
})