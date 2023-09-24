#1.Get familiar with dataframe in R

#creating a dataframe
#example: RPI
days <- c('Mon','Tue','Wed','Thu','Fri','Sat','Sun') #vector:days
temp <- c('23','24','27.5','26.3','28','25.5','27.4') #vector:temperature
snowed <- c('T','T','F','F','T','T','F') #vector:snowed on that day, T = True, F= False
help('data.frame')
RPI_Weather_Week <- data.frame(days,temp,snowed) #creating dataframe using data.frame() function

RPI_Weather_Week
head(RPI_Weather_Week)
help(head)

str(RPI_Weather_Week)
summary(RPI_Weather_Week)

#filtering
RPI_Weather_Week[1,] #showing the first row and all columns
RPI_Weather_Week[,1] #showing the first column and all rows

RPI_Weather_Week[,'snowed']
RPI_Weather_Week[,'days']
RPI_Weather_Week[1:2, 'temp'] #showing column temp and first two rows
RPI_Weather_Week[1:2, c('days','temp')]
RPI_Weather_Week$snowed
subset(RPI_Weather_Week, subset=snowed==TRUE)

sorted.snowed <- order(RPI_Weather_Week[,'snowed']) #getting the index of the ascending order of vector
sorted.snowed
RPI_Weather_Week[sorted.snowed,]

dec.snow <- order(RPI_Weather_Week$temp)
dec.snow

#creating an empty dataframe
empty.DataFrame <- data.frame()
v1 <- 1:10
v1
letters
v2 <- letters[1:10]
v2
df <- data.frame(col.name.1 = v1, col.name.2 = v2) #renaming column names
df
#importing and exporting data
#writing to a csv file
write.csv(df,file = 'D:/01 RPI/MSIT/01 DADA ANALYTICS/W3/saved_df1.csv')
df2 <- read.csv(file = 'D:/01 RPI/MSIT/01 DADA ANALYTICS/W3/saved_df1.csv')
df2
df2 <- read.csv(file.choose()) #two ways to read a csv file

#2.Exercise on getting data in

#read in Excel file
EPI_data <- read.csv(file.choose()) #read directly or by csv convert
EPI_data #name can not be started with numbers; the first row was considered as header, and the second row was considered as the first row of data
head(EPI_data)
nrow(EPI_data)
col(EPI_data)
ncol(EPI_data)
names(EPI_data)
EPI_data[1,]
#need to change the first row to be the header
#names(EPI_data) <- as.matrix(EPI_data[1,]) #be noted it's 1 not EPI
#EPI_data <- EPI_data[-1,] #remove the first row
#EPI_data[] <- lapply(EPI_data,function(x) type.convert(as.character((x)))
names(EPI_data)
head(EPI_data)
#plot some variables
boxplot(EPI_data$EPI)
class(EPI_data$EPI) #check data type
EPI_data$EPI
#EPI_data$EPI <- type.convert(EPI_data$EPI,na.strings = 'NA',numerals = 'allow.loss') #convert characters into numerics
boxplot(EPI_data$EPI,na.action = NULL) #plot fivenums
data() #built in data sets for exploration
help(data)

#tips in R
attach(EPI_data) #add data set in R search path so the objects can be easily inffered to.
help(attach)
boxplot(EPI)
fix(EPI_data) #launches a simple data editior 
EPI
tf <- is.na(EPI) #records True values if the value is NA
tf
E <- EPI[!tf] #filters out NA values, new array
E

#Exercise 1: exploring the distribution
summary(EPI)
fivenum(EPI) #the default setting is removing na
fivenum(EPI,na.rm=TRUE) #na.rm meaning excluding NA values in calculation  
stem(EPI)
pdf('plot_EPI.pdf') #open a device
hist(EPI) #create the plot
hist(EPI,seq(30.,95.,1.0),prob=TRUE) #arithmetic sequence with intervals of 1, and prob means relative frequency
lines(density(EPI,na.rm=TRUE,bw='SJ')) #add a line of kenel density, bw means bandwidth, 
rug(EPI) #draw the scale mark on each data
dev.off() #close the device,the plot will be automatically saved on current work dictionary
getwd() #check work dictionary

#Fitting a distribution beyond histograms
#cumulative density function

plot(ecdf(EPI), do.point=FALSE, verticals=TRUE) #ecdf(EPI) is an object of ecdf value of EPI data
par(pty='s') #to set graphic parameter, pty='s' indicates the ration of vertical and horizontal axis are the same.
help('par')
qqnorm(EPI) #to check whether a data set fits normal distribution
qqline(EPI) #EPI should fits the distribution if the dots align with the line
x <- seq(30,95,1)
qqplot(qt(ppoints(250),df = 5), x, xlab = 'Q-Q plot for tdsn') #qt() to create t distribution
qqline(x)

#fitting another variables
DALY <- type.convert(DALY,na.strings = 'NA',numerals = 'allow.loss') #converting char to num with null values being marked as NA
tf <- is.na(DALY) #assign NA values as object tf
DALY <- DALY[!tf] #remove tf object in DALY
DALY #filtered data

boxplot(EPI,DALY) #compare distributions
qqplot(EPI,DALY)

#Exercise 2 filtering(populations)
#Conditional filtering
Landlock <- type.convert(Landlock,na.strings='NA',numerals='allow.loss') #type converting from char to num
tf <- is.na(Landlock)
Landlock <- Landlock[!tf] #filter valid values
Eland <- EPI[!Landlock]
Eland
hist(Eland)
hist(Eland, seq(30.,95.,1.0), prob=TRUE)

#Additional exploration
WATER_H
WATER_H <- type.convert(WATER_H, na.strings='NA', numerals='allow.loss')
tf <- is.na(WATER_H)
WATER_H <- WATER_H[!tf]
WATER_H
plot(ecdf(WATER_H), dopoints=FALSE, verticals=TRUE)
qqnorm(WATER_H)
qqline(WATER_H)

help(qqplot)


