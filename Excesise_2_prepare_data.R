# Import dplyr library
library(dplyr)

# set working directory
setwd("D:/01. W 2023 2024/Querrying, Data Presentation, Data Visualisation and Reporting")

# import wine data csv file
data <- read.csv("winequality-red.csv", header =  TRUE, sep = ";")

# Back up data
data_process <- data

# Summary Data
summary(data_process)

# Remove "volatile.acidity" and "chlorides"
data_process = subset(data_process, select = -c(volatile.acidity, chlorides))

# Change label name of data frames
names(data_process) <- substr(names(data_process),1,2)

# Filter data that quality values 6 and 7
data_filter <- filter(data_process,qu==6|qu==7)
