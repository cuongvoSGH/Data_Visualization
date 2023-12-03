
library(dplyr)
vehicles <- read.csv('http://jolej.linuxpl.info/vehicles.csv')

summary(vehicles)

select(vehicles, class)

table(select(vehicles, class))

vehicles$class<-factor(vehicles$class)

# ---------------- ----------------------------------------------
#           Visual data analyzis
#---------------------------------------------------------------

# Comparative visualization is used to illustrate the difference between 
# a minimum of two elements at a given time or over a certain period

# A frequently used comparison chart is the box plot. Box plots are usually
# used to compare the distribution of a continuous variable with the 
# values of a categorical characteristic.
# They visualize five summary statistics (minimum, first quartile,
# median, third quartile and maximum) and outlier points. 
# Box plots make it possible to answer the following questions "
# Is the characteristic significant?
# Is the data distributed differently among different subgroups?
# Are data deviations different for different subgroups?
# Do the data contain outliers?

boxplot(vehicles$co2emissions~vehicles$class)

# The chart shows that cars of medium size , compact and even
# smaller have the lowest carbon dioxide emissions, while vans, 
# pickups and special-purpose cars have the highest emissions.


# Visualizing the relationship using a dot plot, allows you to answer questions:
# Is the variable significant?
# What is the relationship between numerical variables?

plot(vehicles$citympg~vehicles$co2emissions)

# The graph shows that when the MPG indicator increases,
# CO2 emissions decrease. This means that vehicles with better 
# fuel economy emit less carbon dioxide.



# Distribution visualizations show the statistical distribution of variable. 
# One of the most commonly used distribution visualizations is the histogram. 
# With the help of a histogram one can show the distribution and skewness of 
# the distribution of data for a certain characteristic.
# Here are some questions that histograms can help answer:
# What is the distribution of the population from which the data came?
# How large is the spread of the data?
# Is the distribution of the data symmetrical or oblique?
# Are there any outliers


hist(vehicles$co2emissions, breaks=30)

# The chart shows that most of the CO2 values are between 250 and 750 grams per mile. 
# It also shows that we have some outliers in the lower part, as well as in the upper 
# part of the range.

# A proportion visualization shows what the data consists of. 
# The cumulative bar chart and pie chart are some of the most commonly 
# used proportion visualizations.


vehicles$drive<-factor(vehicles$drive)

dr<-table(vehicles$drive)
pie(dr)
pie(dr,labels = paste0(round(100 * dr/sum(dr), 2), "%"),col=c("white", "lightblue", "mistyrose", "blue","red"))
legend("topleft",legend=names(dr), fill=c("white", "lightblue", "mistyrose", "blue","red"))

cl<-table(vehicles$class)
pie(cl)





