#Creating Plots
#Chapter 2 -- R Graphics Cookbook
plot(mtcars$wt,mtcars$mpg)
library(ggplot2)
qplot(mtcars$wt,mtcars$mpg) #represents quick plot, x axis and y axis, scatter plot as default, the heavier the car is, the lower the gas efficiency is 
qplot(wt,mpg,data=mtcars)
ggplot(mtcars,aes(x=wt,y=mpg)) + geom_point() #assign dataset and projection, add geometric points

plot(pressure$temperature,pressure$pressure,type='l') #l means plot type as line
points(pressure$temperature,pressure$pressure)
lines(pressure$temperature,pressure$pressure/2,col='red')
points(pressure$temperature,pressure$pressure/2,col='blue')

qplot(pressure$temperature,pressure$pressure, geom='line')
qplot(temperature,pressure,data=pressure, geom='line')
ggplot(pressure,aes(x=temperature,y=pressure)) + geom_line() + geom_point()


