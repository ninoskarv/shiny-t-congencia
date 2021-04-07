
library(shiny)
library(shinyAce)
library(pwr)
library(vcd)
library(factoextra)
library(FactoMineR)
#library(Factoshiny)
library(ggplot2)
library(quantmod)
source("datos.R")
if (interactive()) {
shinyUI(fluidPage(
    titlePanel(""),
    sidebarLayout(     
        sidebarPanel(
            selectInput(inputId ="datos", "Seleccionar variable:",choices=names(Datos2)),
            selectInput(inputId ="datos2", "Seleccionar 2da variable:",choices=names(Datos2)),
             
            inputPanel(style = "background-color: lightblue",
                       selectInput(inputId ="ACM", "Seleccionar cantidad de variables para A. de Correspondencias:",choices=c("2","3","4","5")),
                       conditionalPanel(
                           condition = "input.ACM == '2'",
                           selectInput(inputId ="d1", "Seleccionar variable:",choices=names(Datos3)),
                           selectInput(inputId ="d2", "Seleccionar 2da variable:",choices=names(Datos3[2:22]))),
                conditionalPanel(
                    condition = "input.ACM == '3'",
                    selectInput(inputId ="d3", "Seleccionar variable:",choices=names(Datos3)),
                    selectInput(inputId ="d4", "Seleccionar 2da variable:",choices=names(Datos3[2:22])),
                    selectInput(inputId ="d5", "Seleccionar 3ra variable:",choices=names(Datos3[3:22]))),
                conditionalPanel(
                    condition = "input.ACM == '4'",
                    selectInput(inputId ="d6", "Seleccionar variable:",choices=names(Datos3)),
                    selectInput(inputId ="d7", "Seleccionar 2da variable:",choices=names(Datos3[2:22])),
                    selectInput(inputId ="d8", "Seleccionar 3ra variable:",choices=names(Datos3[3:22])),
                    selectInput(inputId ="d9", "Seleccionar 4ta variable:",choices=names(Datos3[4:22]))),
                conditionalPanel(
                    condition = "input.ACM == '5'",
                    selectInput(inputId ="d10", "Seleccionar variable:",choices=names(Datos3)),
                    selectInput(inputId ="d11", "Seleccionar 2da variable:",choices=names(Datos3[2:22])),
                    selectInput(inputId ="d12", "Seleccionar 3ra variable:",choices=names(Datos3[3:22])),
                    selectInput(inputId ="d13", "Seleccionar 4ta variable:",choices=names(Datos3[4:22])),
                    selectInput(inputId ="d14", "Seleccionar 5ta variable:",choices=names(Datos3[5:22])))
                ),
                ),
        
        # Show a plot of the generated distribution
        mainPanel(tabsetPanel(
            tabPanel( h4('Tabla de contingencia') ,
            
            #tableOutput("view")
            verbatimTextOutput("tabla"),
            #textOutput('tabla'),
            #dataTableOutput('tabla')
            #tableOutput("tabla"),
            h4("test chi-cuadrado"),
            verbatimTextOutput("test")),
            tabPanel( h4("Análisis de Correspondencias"),
           plotOutput("plot"))
        ))
    )
))
}