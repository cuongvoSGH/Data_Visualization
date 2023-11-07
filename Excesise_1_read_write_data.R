# Excesise 1
# Import readxl and writexl Package
library(readxl)
library(writexl)

# Set wd
setwd("D:/01. W 2023 2024/Querrying, Data Presentation, Data Visualisation and Reporting")

# Read Excel file 
data <- read_excel("Excesise_1_Data_input.xls")

#Backup data
data_process <- data

#Raise square of last column
data_process[,length(data_process)] = data_process[,length(data_process)] ^ 2

# Write Excel File
write_xlsx(data_process,"Excesise_1_Data_output.xls")