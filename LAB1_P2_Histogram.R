#Creating Histogram
#View the distribution of one-dimensional data with a histogram
mtcars$mpg
hist(mtcars$mpg)
hist(mtcars$mpg,breaks = 10) #specify approximate number of bins with breaks
hist(mtcars$mpg,breaks = 5)
hist(mtcars$mpg,breaks = 12)

qplot(mpg,data=mtcars,binwidth=4)
ggplot(mtcars, aes(x=mpg)) + geom_histogram(binwidth = 4)
ggplot(mtcars, aes(x=mpg)) + geom_histogram(binwidth = 5)
