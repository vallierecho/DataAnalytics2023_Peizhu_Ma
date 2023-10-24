#creating a matrix data with random numbers and plotting the matrix using the image function
set.seed(12345)
# par can be used to set or query graphical parameters.
# Parameters can be set by specifying them as arguments 
# to par in tag = value form, or by passing them as a list of tagged values
par(mar=rep(2,4))
data_Matrix <- matrix(rnorm(400),nrow=40)
image(1:10,1:40,t(data_Matrix)[,nrow(data_Matrix):1])
data_Matrix

#because the data is randomly created, there's no pattern in the heatmap
help(heatmap)
par(mar=rep(0.2,4))
heatmap(data_Matrix)
help("rbinom")

#generate a data sample that's with a pattern of coin flipping
set.seed(678910)
for(i in 1:40){
  coin_Flip <- rbinom(1, size=1, prob=0.5)
  if(coin_Flip){
    data_Matrix[i,] <- data_Matrix[i,]+rep(c(0,3),each=5)
  }
}

#we can see from the image that there's pattern because they have a higher value and the left hand five columns that are little bit more in red color which means they have a lower value
par(mar= rep(2, 4))
image(1:10, 1:40, t(data_Matrix)[, nrow(data_Matrix):1])
heatmap(data_Matrix)
#take a closer look at the patters in rows and columns by looking at the marginal means of the rows and columns ten different columns mean and forty different rows means
hh <- hclust(dist(data_Matrix))
data_Matrix_Ordered <- data_Matrix[hh$order,]
par(mfrow=c(1,3))
image(t(data_Matrix_Ordered)[,nrow(data_Matrix_Ordered):1])
plot(rowMeans(data_Matrix_Ordered),40:1,,xlab='The Row Mean',ylab='Row',pch=19)
plot(rowMeans(data_Matrix_Ordered),xlab='Column',ylab='Column Mean',pch=19)