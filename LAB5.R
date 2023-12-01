#Cook's distance with least-square regression

mtcars
help(mtcars)
head(mtcars)
str(mtcars)

#build the linear regression model: miles per gallon ~ number of cylinders + weight
model1 <- lm(mpg ~ cyl + wt, data=mtcars)
model1
plot(model1, pch=18, col='red',which=c(4))

#use cook's distance to indentify the cook's distance to each observation
cooks.distance(model1)
CooksDistance <- cooks.distance(model1)
CooksDistance

#round off the values to 5 decimal points so it is easy to read
round(CooksDistance,5)

#sort the values in ascending order find the outliers
sort(round(CooksDistance,5))

#Outlier Detection: Cook's Distance
library(ISLR)
head(Hitters)
dim(Hitters)
#remove the NA values
is.na(Hitters)
HittersData <- na.omit(Hitters)
dim(HittersData)
head(HittersData)

#predict the salary of the baseball player with the multivariate regression model
SalaryPredictModel1 <- lm(Salary~., data=HittersData)
summary(SalaryPredictModel1)

#Cook's Distance
cooksD <- cooks.distance(SalaryPredictModel1)
influential <- cooksD[(cooksD > (3 * mean(cooksD, na.rm= TRUE)))]
influential

#exclude the players that are seen as outliers and see if the regression model would be a better fit
library(dplyr)
name_of_influencial <- names(influential)
name_of_influencial
outliers <- HittersData[name_of_influencial,]
Hitters_Without_Outliers <- HittersData %>% anti_join(outliers)

#model2：without the outliers
SalaryPredictModel2 <- lm(Salary ~.,data = Hitters_Without_Outliers )
summary(SalaryPredictModel2) #we could see from the result that the adjusted R-square is improved, which mean the model is a better fit

#normality test
#generate dataset
set.seed(10)
data1 <- rnorm(50)
set.seed(30)
data2 <- rnorm(50)

#Shapiro-Wilk Normality test
shapiro.test(data1)
shapiro.test(data2)
hist(data1,col='green')
hist(data2,col='steelblue')

set.seed(0)
data <- rnorm(100)
shapiro.test(data)

set.seed(0)
#create dataset of 100 random values generated from a Poisson distribution
data <- rpois(n=100,lambda = 3)
shapiro.test(data) #p value below than 0.05
hist(data,col='yellow')

library(nortest)
#ceate dataset of 100 random values with value 0
set.seed(1)
x <- rnorm(100,0,1)
ad.test(x) #Anderson-Darling test to test for normality

set.seed(1)
x <-runif(100,0,1)
ad.test(x)