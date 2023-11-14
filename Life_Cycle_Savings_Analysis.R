library(dplyr)
attach(LifeCycleSavings)

?LifeCycleSavings

head(LifeCycleSavings)
str(LifeCycleSavings)
summary(LifeCycleSavings)

mean(LifeCycleSavings$sr)
sd(LifeCycleSavings$sr)

boxplot(LifeCycleSavings$sr)

cor(LifeCycleSavings[, c("sr", "dpi", "ddpi")])

plot(sr, pop15)
plot(sr, pop75)

hist(sr)

top10sr <- arrange(LifeCycleSavings, desc(sr)) %>% select('sr')
top10sr<- top10sr %>% top_n(10)
top10sr
barplot(top10sr$sr, names = row.names(top10sr))

?barplot

row.names(top10sr)

?LifeCycleSavings
require(stats)
require(graphics)
pairs(LifeCycleSavings, panel = points)
pairs(LifeCycleSavings)
?hist
