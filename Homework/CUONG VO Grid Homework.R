##### CUONG VO 131116 #####
define_region <- function(row, col){
  viewport(layout.pos.row = row, layout.pos.col = col)
}

##### Convert from Ggplot2 to Grid #####
library(ggplot2movies)
library(ggplot2)
library(ggcorrplot)
library(dplyr)
library(tidyr)
library(gridExtra)
library(grid)
data(movies)
movies <- as.data.frame(movies)
movies[,"budget"] <- movies[,"budget"] / 1000000
movies[,"votes"] <- movies[,"votes"] / 1000
movies_wobudget <- filter(movies, budget!="NA")


##### ggplot2 code for boxplot & histogram
movies_bw <- movies[,c("length", "rating","votes")] %>% 
  pivot_longer(
    cols = c("length", "rating", "votes"),
    names_to = "items",
    values_to = "value"
  )

p_rating_bw <- ggplot(filter(movies_bw, items =="rating"), aes(items, value))
p_rating_bw <- p_rating_bw + geom_boxplot(outlier.color = "red")

p_rating_hist <- ggplot(filter(movies_bw, items =="rating"), aes(value))
p_rating_hist <- p_rating_hist + geom_histogram() + labs(x = "rating")

##### Grid code for boxplot & histogram
grid.newpage()
pushViewport(viewport(layout = grid.layout(nrow = 1, ncol = 2)))
print(p_rating_bw, vp = define_region(row = 1, col = 1))
print(p_rating_hist, vp = define_region(row = 1, col = 2))

##### ggplot2 code for line chart
df <- movies %>% 
  group_by(year) %>%
  summarise(
    AVG_len = mean(length),
    AVG_vote = mean(votes)
  )

df <- as.data.frame(df) %>% pivot_longer(
  cols = c("AVG_len", "AVG_vote"), 
  names_to = "items",
  values_to = "value"
)

p_avg_len <- ggplot(filter(df, items=="AVG_len"), aes(year, value)) + 
  geom_line(color="darkred") + 
  labs(x="Average Length")
p_avg_vote <- ggplot(filter(df, items=="AVG_vote"), aes(year, value)) + 
  geom_line(color="steelblue") +
  labs(x="Average Votes")

##### Grid code for line chart
grid.newpage()
pushViewport(viewport(layout = grid.layout(nrow = 2, ncol = 1)))
print(p_avg_len, vp = define_region(row = 1, col = 1))
print(p_avg_vote, vp = define_region(row = 2, col = 1))

##### ggplot2 code for bar chart
movies_genres <- movies_wobudget[,c("title", "year", "length", "rating", "votes", "budget",
                                    "Action", "Animation", "Comedy", "Drama", 
                                    "Documentary", "Romance", "Short")]
df <- movies_genres %>%  
  pivot_longer(
    cols=c("Action", "Animation", "Comedy", "Drama", "Documentary", "Romance", "Short"),
    names_to = "genres",
    values_to = "value"
  )
df <- filter(df, value !=0)

total = dim(movies)[1]

df <- df %>% group_by(genres) %>%
  summarise(
    avg_len = mean(length),
    avg_rate = sum(rating * votes) / sum(votes),
    avg_budget = mean(budget),
    pct = sum(value) / total
  )

p1 <- ggplot(df, aes(x=reorder(genres, +avg_len), y =avg_len)) + 
  geom_bar(stat = "identity", width = 0.4) + 
  coord_flip() +
  labs(x="", y = "Average Length")
p2 <- ggplot(df, aes(x=reorder(genres, +avg_rate), y =avg_rate)) + 
  geom_bar(stat = "identity", width = 0.4) + 
  coord_flip() +
  labs(x="", y = "Average Rate")
p3 <- ggplot(df, aes(x=reorder(genres, +avg_budget), y =avg_budget)) + 
  geom_bar(stat = "identity", width = 0.4) + 
  coord_flip() +
  labs(x="", y = "Average Budget")
p4 <- ggplot(df, aes(x=reorder(genres, +pct), y =pct)) + 
  geom_bar(stat = "identity", width = 0.4) + 
  coord_flip() +
  labs(x="", y = "Percentage")

##### Grid code for bar chart
grid.newpage()
pushViewport(viewport(layout = grid.layout(nrow = 2, ncol = 2)))
print(p1, vp = define_region(row = 1, col = 1))
print(p2, vp = define_region(row = 2, col = 1))
print(p3, vp = define_region(row = 1, col = 2))
print(p4, vp = define_region(row = 2, col = 2))

##### Convert from Lattice to Grid #####
data("Investment", package = "sandwich")
Investment_df <- as.data.frame(Investment)

library(grid)
library(lattice)
library(dplyr)
library(tidyr)

###### Lattice code for Histogram & Boxplot
df <- Investment_df %>% pivot_longer(cols = !0, names_to = "Items", values_to = "Amount" )
df_Invest <- filter(df, Items == "Investment" | Items == "RealInv" ) 

bw1 <- bwplot(Amount~Items, data = df_Invest, main = "Investment") # Boxplot in Lattice
h1 <- histogram(~Investment_df[,"GNP"], type="count", xlab = "GNP") # Histogram in Lattice

###### Grid code for Histogram & Boxplot
grid.newpage()
pushViewport(viewport(layout = grid.layout(nrow = 1, ncol = 2)))
print(bw1, vp = define_region(row = 1, col = 1))
print(h1, vp = define_region(row = 1, col = 2))

###### Lattice code for corrplot
cor_matrix = cor(Investment_df[,c("GNP", "RealGNP", "Investment", "RealInv", "Interest", "Price")])
matrix_plot <- levelplot(cor_matrix, scale=list(x=list(rot=45)))

###### Grid code for Corrplot
grid.newpage()
pushViewport()
print(matrix_plot, vp = viewport(), newpage=FALSE)

###### Lattice code for relationship between 2 variables
cor_plot <- xyplot(Investment~GNP, data = Investment_df, 
       main = "Relationship between Investment and GNP",
       type = c("o", "r"))

###### Grid code for relationship between 2 variables
grid.newpage()
pushViewport()
print(cor_plot, vp = viewport(), newpage=FALSE)

###### Lattice code for time series
ts_plot <- xyplot(Investment[,c("GNP", "Investment", "Interest")])

###### Grid code for time series
grid.newpage()
pushViewport()
print(ts_plot, vp = viewport(), newpage=FALSE)
