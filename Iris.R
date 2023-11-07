gender <- factor(c("man", "man", "woman","man"))
gender
summary(gender)

data(iris)
head(iris)
summary(iris)
dim(iris)
names(iris)

hist(iris$Sepal.Length,
     col='steelblue',
     main='Histogram',
     xlab='Length',
     ylab='Frequency')

plot(iris$Sepal.Width, iris$Sepal.Length,
     col='steelblue',
     main='Scatterplot',
     xlab='Sepal Width',
     ylab='Sepal Length',
     pch=19)

boxplot(Sepal.Length~Species,
        data=iris,
        main='Sepal Length by Species',
        xlab='Species',
        ylab='Sepal Length',
        col='steelblue',
        border='black')

plot(iris)
str(iris)
sapply(iris, function(x) sum(is.na(x)))

data = iris[,-1]

library(GGally)
ggpairs(data, columns=1:4, aes(color=Species)) +   ggtitle("Iris Data ")

pairs(iris[,1:4],col=iris[,5],oma=c(4,4,6,12))
par(xpd=TRUE)
legend(0.85,0.6, as.vector(unique(iris$Species)),fill=c(1,2,3))


set.seed(101)
irisCluster <- kmeans(data[,1:4], center=3, nstart=20)
irisCluster

packageSet <- c("car", "abind", "aplpack", "colorspace", "effects", "Hmisc",
                "leaps", "zoo", "lmtest", "mvtnorm", "multcomp", "relimp", "rgl", "RODBC",
                "clv", "rpart.plot", "flexclust", "e1071", "sem", "Rcmdr","foreign","tree","rpart","rattle","ipred","randomForest","dplyr","sqldf","genalg","corrplot","caret","nnet","RSNNS","NeuralNetTools","devtools","kohonen","tidyverse","caTools","XLConnect")
install.packages(packageSet)
rm(packageSet)