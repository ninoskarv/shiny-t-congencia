

library(shiny)
library(shinyAce)
library(pwr)
library(vcd)
library(factoextra)
library(ggplot2)
library(FactoMineR)
#library(Factoshiny)
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    output$test=renderPrint({
        # output$test=renderTable({
        # Tabla(Datos2[,input$datos],Datos2[,input$datos2])$Test
        # a<-table(Datos2[,input$datos],Datos2[,input$datos2])
        #b<-chisq.test(a)
        #data.frame("statistic"=b$statistic,"p-value"=b$p.value)
        Tabla(Datos2[,input$datos],Datos2[,input$datos2],input$datos,input$datos2)$Test
        
        
    })
    
    output$tabla=renderPrint({
        
        # as.data.frame.matrix(table(Datos2[,input$datos],Datos2[,input$datos2]))
        
        Tabla(Datos2[,input$datos],Datos2[,input$datos2],input$datos,input$datos2)$TABLA
        # Tabla(Datos2[,input$datos],Datos2[,input$datos2])$TABLA
        
    })
    output$plot=renderPlot({
        if(input$ACM=="2"){
            Datos=data.frame(Datos3[,input$d1],Datos3[,input$d2])
            names(Datos)=c(input$d1,input$d2)
            anl1(Datos)
            # res.MCA  <- MCA(Datos, graph=F)
            #plot(res.mca,invisible = ("ind"))
          # plot.MCA(res.MCA, choix='var',col.quali.sup='#006400')
           # plot.MCA(res.mca,col.quali.sup='#006400',label =c('ind','var')) 
         
           #MCAshiny(res.MCA)
           
            }
        else if(input$ACM=="3"){
            Datos=data.frame(Datos3[,input$d3],Datos3[,input$d4],Datos3[,input$d5])
           names(Datos)=c(input$d3,input$d4,input$d5)
          anl1(Datos)
         
            
        }
        else if(input$ACM=="4"){
            Datos=data.frame(Datos3[,input$d6],Datos3[,input$d7],Datos3[,input$d8],Datos3[,input$d9])
            names(Datos)=c(input$d6,input$d7,input$d8,input$d9)
            anl1(Datos)
            
            
        }
        else if(input$ACM=="5"){
            Datos=data.frame(Datos3[,input$d10],Datos3[,input$d11],Datos3[,input$d12],Datos3[,input$d13],Datos3[,input$d14])
            names(Datos)=c(input$d10,input$d11,input$d12,input$d13,input$d14)
            anl1(Datos)
            
            
        }
    })
    
})
