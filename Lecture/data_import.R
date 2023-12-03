# Data import from csv file, from the web page

a<-read.csv("http://jolej.linuxpl.info/crx.txt", header=TRUE)


# Data import from MS Excel file, package RODBC

library(RODBC)
setwd("D:/Jarek/BD_DATA")
dane <- odbcConnectExcel("Data1.xls")
DANE <- sqlQuery(dane, "select * from [Data$]")



# Data import from Excel file, package XLConnect

library(XLConnect)

DANE2<- readNamedRegionFromFile("Data10_11.xls", name=c("Cost","Production"))

# Data export from R to Excel worksheet , package XLConnet

Cost2<-(DANE2$Cost*0.1)/2
writeWorksheetToFile("Data10_11.xls", data=Cost2, sheet="Wyniki",header=TRUE, startRow=1, startCol = 2)

# Data import from Excel file, package readxl

library(readxl)



setwd("D:/Jarek/BD_DATA")
my_data <- read_excel("Data1.xls", sheet="Data")
my_data <- read_excel(file.choose())
names(my_data)<-c("A","B","C","D","E")





