
library(shiny)

shinyUI(fluidPage(
    
    # Application title
    titlePanel("Miles per Gallon Prediction"),
    
    # Sidebar that allows for user defined input
    sidebarLayout(
        sidebarPanel(
            h3(helpText("This shinny app predicts Miles per Gallon (MPG) of cars based on the selection you made in Car Weight, Transimission Type and Acceleration Speed")),
            helpText("Guide: Please select or enter value in the three variables below. The liner regression model is ploted on the right-hand side, with weight(wt) as the x-axis
                    and MPG as the y-axis.The predicted MPG calculated from your input is displayed underneath the plot."),
            numericInput("wt", label = h4("Car Weight (1000 lbs)"), step = 0.1, value = 3),
            selectInput("am", label = h4("Transimission Type"), 
                        choices = list("Automatic" = "Automatic", "Manual" = "Manual")),
            numericInput("qsec", label = h4("Acceleration Speed (1/4 mile time)"), step = 0.1, value = 16)
        ),
        
     # Show a plot with MPG and regression line
        mainPanel(
            plotOutput("distPlot"),
            h4("Predicted value of MPG:"),
            h3(textOutput("result"))
        )
    )
))