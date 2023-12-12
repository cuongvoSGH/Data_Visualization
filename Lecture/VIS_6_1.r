# Lattice package - ci�g 

# Program 1 - Display data in many panels

# mtcars - The data was extracted from the 1974 Motor Trend US magazine, and # comprises fuel consumption and 10 aspects of automobile design and performance # for 32 automobiles (1973�74 models). 

# mpg - Miles/(US) gallon
# cyl - Number of cylinders
# disp - Displacement (cu.in.)
# gear - Number of forward gears
# carb - Number of carburetors

library(lattice)

xyplot(mpg ~ disp | factor(gear), data=mtcars)

# Program 2 Control of panels leyout

# aspect - adjusting panels size

xyplot(mpg ~ disp | factor(gear), data=mtcars, layout=c(3, 1),aspect="fill")

xyplot(mpg ~ disp | factor(gear), data=mtcars, layout=c(3, 1),aspect=1)


# Program 3 Different charts in separate panels

plot1 <- xyplot(mpg ~ disp, data=mtcars, 
                aspect=1, xlim=c(65, 480), ylim=c(9, 35),
                subset=gear == 5)
plot2 <- xyplot(mpg ~ disp, data=mtcars, 
                aspect=1, xlim=c(65, 480), ylim=c(9, 35),
                subset=gear == 4)
plot3 <- xyplot(mpg ~ disp, data=mtcars, 
                aspect=1, xlim=c(65, 480), ylim=c(9, 35),
                subset=gear == 3)
print(plot1, position=c(0, 2/3, 1, 1), more=TRUE)
print(plot2, position=c(0, 1/3, 1, 2/3), more=TRUE)
print(plot3, position=c(0, 0, 1, 1/3))

#position - panel localization in graphical window - arguments (left, bottom,right, top).


# Program 4 Scaterplot with grouping

gear.f<-factor((mtcars$gear),
labels=c("3gears","4gears","5gears"))

xyplot(mpg ~ disp, data=mtcars,
group=gear.f,auto.key=list(border=TRUE))


xyplot(mpg ~ disp, data=mtcars,
group=gear.f,auto.key=list(border=TRUE),
par.settings=list(superpose.symbol=list(pch=c(2, 3, 16))))

# ustawienie auto.key=list(border=TRUE) wprowadza legend� do wykresu

# Program 5 Changing axes annotation

xyplot(mpg ~ disp | factor(gear), data=mtcars,
       layout=c(3, 1), aspect=1,
       scales=list(y=list(at=seq(10, 30, 10))),
       ylab="miles per gallon",
       xlab=expression(paste("displacement (", inch^3, ")")))



# Program 6 scaterplot with regression line

xyplot(mpg ~ disp | factor(gear), data=mtcars,
       layout=c(3, 1), aspect=2,
       panel=function(x, y) {
	 panel.lmline(x, y)
           panel.xyplot(x, y)
       })






















