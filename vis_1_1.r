# Traditional graphics

# One variable

# Program 1

par(mfrow=c(2, 2), mar=c(4, 4, 1, 1))
y <- rnorm(20)
plot(y, type="p")
plot(y, type="l")
plot(y, type="b")
plot(y, type="h")

#Program 2

plot((1:10)^2,xlim=c(0, 11), ylim=c(0, 110))

# Program 3

a<-table(rep(1:3, 1:3))
b<-rep(1:3)
plot(b,lwd=3, xlim=c(0, 4), ylim=c(0, 4))
plot(a,lwd=3, xlim=c(0, 4), ylim=c(0, 4))

# Program 4

barplot(table(rep(1:3, 1:3)),xlim=c(-1, 5), ylim=c(0, 4),col = "grey")

#Program 5

pie(c(1, 2, 3), col=gray(1:3/4))

# Program 6

dotchart(1:4, pch=21, bg="gray", lcolor="black", xlim=c(0, 4))

# Program 7

boxplot((1:10)^2, col="gray", ylim=c(-10, 110))

# Program 8

hist((1:100)^2, col="gray", breaks=6, xlim=c(-1000, 11000), ylim=c(0, 50))






