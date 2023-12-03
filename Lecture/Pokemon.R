setwd("D:/CUONGVO/")
library(ggplot2)

pick_record <- function(){
  j <- 1
  df <- data.frame(matrix(0,ncol=1))
  colnames(df) <- "Picks"
  df[j,1] <- sample(c(1:36),1)
  df.check <- data.frame(matrix(0,ncol=1,nrow=36))
  colnames(df.check) <- "check"
  df.check[df[j,1],1] <- 1
  while (sum(df.check$check) != 36) {
    j <- j + 1
    df[j,1] <- sample(c(1:36),1)
    df.check[df[j,1],1] <- 1
  }
  return(j)
}

i<-1
result <- data.frame(matrix(0,ncol = 1))
colnames(result) <- "Total_Picks"

while (i<=1000) {
  result[i,1] <- pick_record()
  # print(i)
  i <- i +1
}

Chart <- ggplot(result,aes(x = Total_Picks)) + geom_histogram(binwidth = 10, color = "Black", fill = "White")
Chart <- Chart + geom_vline(xintercept = mean(result$Total_Picks),col = "red",lwd = 1)
Chart <- Chart + annotate("text",x = mean(result$Total_Picks) * 1.5,y = mean(result$Total_Picks)*0.25,label = paste("Mean =", mean(result$Total_Picks)),col = "red",size = 3)
Chart <- Chart + annotate("text",x = min(result$Total_Picks),y = 10,label = paste("Min =", min(result$Total_Picks)),col = "red",size = 3)
Chart <- Chart + annotate("text",x = max(result$Total_Picks),y = 10,label = paste("Max =", max(result$Total_Picks)),col = "red",size = 3)
Chart
