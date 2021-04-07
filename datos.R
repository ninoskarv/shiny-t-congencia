if (!exists(".inflation")) {
  .inflation <- getSymbols('CPIAUCNS', src = 'FRED', 
                           auto.assign = FALSE)
} 
library(readxl)
library(factoextra)
library(FactoMineR)
library(ggplot2)
#setwd("C:/Users/Ninoska/Documents/Fondecyt/para_tesis/tab_contigencias")
#Datos<-read_excel("C:/Users/Ninoska/Documents/Fondecyt/para_tesis/tcontingencia/analisis_estadisticos_05_04.xlsx",1)
Datos2<-read_excel("analisis_estadisticos_06_04_cont.xlsx",1)
Datos3<-read_excel("analisis_estadisticos_06_04_cont.xlsx",2)
Datos2<-as.data.frame(Datos2)
Datos3<-as.data.frame(Datos3)


dd<-data.frame("unav"=Datos3$`MP2,5 Interior`,"una3"=Datos3$`MP2,5 Exterior`)
#dd<-as.data.frame(dd)
#Datos3<-read_excel("analisis_estadisticos_05_04.xlsx",1)

Tabla<-function(Variable1,Variable2,x,y){
#tab=as.data.frame.matrix(table(x,y))
  tab1<-table(Variable1,Variable2)
  #tab<-as.data.frame.matrix(tab1)
tab=with(warpbreaks, table(Variable1,Variable2,dnn = c(x,y)))
tab=addmargins(tab, c(1, 2))
tab=as.table.default(tab)
tes<-chisq.test(tab1)
tes1=data.frame("statistic"=tes$statistic,"p-value"=tes$p.value)
return(list(TABLA=tab,Test=tes1))
}

anl<-function(datoss){
  acm2 <- MCA(datoss, graph=F)
  
  cats=apply(datoss, 2, function(x) nlevels(as.factor(x)))
  acm2_vars_df = data.frame(acm2$var$coord, Variable = rep(names(cats),cats))
  acm2_obs_df=data.frame(acm2$ind$coord)
  ggplot(data = acm2_obs_df, aes(x = Dim.1, y = Dim.2),
         circle = T,ellipse = T) +
    geom_hline(yintercept = 0,colour = "gray70") + 
    geom_vline(xintercept = 0, colour = "gray70") + 
    #geom_point(colour = "gray50",alpha = 0.7) + 
    #geom_density2d(colour = "gray80")+
    geom_text(data = acm2_vars_df,
              aes(x = Dim.1, y = Dim.2, label = rownames(acm2_vars_df),
                  colour = Variable)) +
    ggtitle("MCA ") +
    scale_colour_discrete(name = "Variables")
}

anl1<-function(datoss){
  res.mca  <- MCA(datoss, graph=F)
  fviz_mca_var(res.mca, repel = TRUE, # Avoid text overlapping (slow)
                          ggtheme = theme_minimal())
}


#res.MCA  <- MCA(dd, graph=F)
#plot(res.mca,invisible = ("ind"))
#anl1(dd)
#anl1(dd)

#res.ca <- CA(Datos2, graph = FALSE)
#fviz_ca_row(res.ca, repel = TRUE)
#fviz_ca_col(res.ca)
#fviz_ca_biplot(res.ca, repel = TRUE)


#res.mca <- MCA(Datos3, graph = FALSE)
#fviz_mca_var(res.mca, 
 #            repel = TRUE, # Avoid text overlapping (slow)
  #           ggtheme = theme_minimal())

#chisqSh(tab1, data = parent.frame(),p=NULL,options=NULL)
#Tabla(Datos2$MP2_5_ext,Datos2$MP10_Exterior)$TABLA
#Tabla(Datos2$MP2_5_ext,Datos2$MP10_Exterior)$Test

#a<-(table(Datos2$MP2_5_ext,Datos2$MP10_Exterior))
#data.matrix(a)
#b<-chisq.test(a)
