#Regression to explore the relationship between unemployment rate and enrollment rate
multi_data <- read.csv(file.choose())
View(multi_data)
attach(multi_data)

#linear model
lmmulti_data <- lm(ROLL~UNEM+HGRAD, multi_data)
lmmulti_data
summary(lmmulti_data)
residuals(lmmulti_data)
clmmulti <- coef(lmmulti_data)

#predict ROLL
NEW <- data.frame(UNEM=0.07,HGRAD=90000)
NEW
pROLL <- predict(lmmulti_data,NEW,interval = 'prediction')
cROLL <- predict(lmmulti_data,NEW,interval = 'confidence')
pROLL
cROLL
#new model with INC
newlmmulti <- lm(ROLL~UNEM+HGRAD+INC, multi_data)
summary(newlmmulti)

#predict ROLL
NEW1 <- data.frame(UNEM=0.07,HGRAD=90000,INC=25000)
NEW1
pROLL1 <- predict(newlmmulti,NEW1,interval = 'prediction')
cROLL1 <- predict(newlmmulti,NEW1,interval = 'confidence')
pROLL1
cROLL1


#Classification
#read data file
abalone_data <- read.csv(file.choose())
View(abalone_data)
summary(abalone_data)
attach(abalone_data)
abalone_data$Rings <- cut(Rings, br=c(-1,8,11,35), labels=c('young', 'adult', 'old'))

summary(Rings)
Sex
aba <- abalone_data #remove the sex variable because knn needs numeric variables for prediction
aba$Sex <- NULL

#normalize the data using min max normalization
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}
aba[1:7]
aba[1:7] <- as.data.frame(lapply(aba[1:7], normalize))
summary(aba$Shucked.weight)

#split training and testing dataset
ind <- sample(2,nrow(aba),replace=TRUE,pro=c(0.7,0.3))
help("sample")
KNNtrain <- aba[ind==1,]
KNNtest <- aba[ind==2,]
sqrt(2918)

library(class)
KNNpred <- knn(train=KNNtrain[1:7], test=KNNtest[1:7], cl=KNNtrain$Rings,k=55)
KNNpred
table(KNNpred)
help("knn")

#Clustering
iris
library(ggplot2) # we will use ggplot2 to visualize the data.
head(iris) 
str(iris) 
summary(iris) 

help("sapply")
sapply(iris[,-5], var)
summary(iris)

# plot Sepal.Length Vs Sepal.Width using ggplot
ggplot(iris,aes(x = Sepal.Length, y = Sepal.Width, col= Species)) + geom_point()
# plot Petal.Length Vs Sepal.Width using ggplot
ggplot(iris,aes(x = Petal.Length, y = Petal.Width, col= Species)) + geom_point()

# kmeans clustering
set.seed(300)
k.max <- 12
# tot.withinss = Total within-cluster sum of square 
# iter.max = the maximum number of iterations allowed
# nstart = if centers is a number, how many random sets should be chosen.
wss<- sapply(1:k.max,function(k){kmeans(iris[,3:4],k,nstart = 20,iter.max = 1000)$tot.withinss})
wss # within sum of squares.
plot(1:k.max,wss, type= "b", xlab = "Number of clusters(k)", ylab = "Within cluster sum of squares")
icluster <- kmeans(iris[,3:4],3,nstart = 20)
table(iris[,5],icluster$cluster) 
# In the table we can see that most of the observations have been clustered correctly 
# however, 2 of the versicolor have been put in the cluster with all the virginica 
# and 4 of the verginica have been put in cluster 3 which mostly has versicolo

