# Traditional graphics - package graphics

# Two variables

#Program 1

plot(1:10, (1:10)^2, pch=21, bg="gray", xlim=c(0,11), ylim=c(-10, 110))

# Program 2

x <- rnorm(10000)
smoothScatter(x, x + rnorm(10000)/3,xlim=c(-5, 5), ylim=c(-5, 5))

#Program 3

sunflowerplot(iris[, 3:4])

x <- sample(1:4, 20, replace=TRUE)
y <- x + sample(0:1, 20, replace=TRUE)
sunflowerplot(x, y,seg.col="black", size=.08, xlim=c(0, 5), ylim=c(0, 6))

#Program 4 

boxplot(list((1:10)^2, 120 - (1:10)^2), col="gray", boxwex=0.5,ylim=c(-10, 130))

#Program 5

barplot(rbind(1:3,(1:3)^2),xlim=c(0, 4), ylim=c(0, 13))

#Program 6

barplot(rbind(1:3, (1:3)^2),beside=TRUE,xlim=c(0, 10), ylim=c(0, 11))

#Program 7 

stripchart(list((1:10)^2, 140 - (1:10)^2),xlim=c(-10, 150), ylim=c(0, 3), pch=21, bg="gray")

#Program 8

spineplot(rep(1:3, each=6), factor(c(rep(1:3, 3:1), rep(1:3, 2), rep(1:3, 1:3))), box=FALSE)

#Program 9

cdplot(rep(1:3, each=6), factor(c(rep(1:3, 3:1), rep(1:3, 2), rep(1:3, 1:3))), box=FALSE)

# Program 10

spineplot(factor(rep(1:3, each=6)), factor(c(rep(1:3, 3:1), rep(1:3, 2), rep(1:3, 1:3))))

# Program 11

x <- margin.table(HairEyeColor, c(1, 2))
assocplot(x, main = "Relation between hair and eye color")


# Program 12

## Use the Berkeley admission data as in Friendly (1995).
x <- aperm(UCBAdmissions, c(2, 1, 3))
dimnames(x)[[2]] <- c("Yes", "No")
names(dimnames(x)) <- c("Sex", "Admit?", "Department")
stats::ftable(x)

## Fourfold display of data aggregated over departments, with
## frequencies standardized to equate the margins for admission
## and sex.
## Figure 1 in Friendly (1994).
fourfoldplot(margin.table(x, c(1, 2)))

## Fourfold display of x, with frequencies in each table
## standardized to equate the margins for admission and sex.
## Figure 2 in Friendly (1994).
fourfoldplot(x)

# Program 13

mosaicplot(~Survived+Sex + Class , data = Titanic, color = TRUE)


# Exercise

# Please analyse dataset LifeCycleSavings, create charts showing conlusions.
# Meaning of variabales are available in R help after typing 
# ?LifeCycleSavings in R console. 








