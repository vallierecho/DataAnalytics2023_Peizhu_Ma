#PART1 2A Measures of Central 
#Measures of central tendency

#read the file
getwd()
dir()
environment()
EPI_data <- read.csv(file.choose()) #import data file
View(EPI_data)
head(EPI_data) #check if data is in correct format
names(EPI_data) #check the columns of the data

#munging the data file
ln <- EPI_data[1,]
names(EPI_data) <- as.matrix(ln) 
EPI_data <- EPI_data[-1,] #set the first line as headers and delete the first line
head(EPI_data)
attach(EPI_data)

#prepare for mode calculation
install.packages("DescTools")                # Install DescTools package
library("DescTools")                         # Load DescTools package

AIR_E <- as.numeric(AIR_E)
le <- is.na(AIR_E)
AIR_E <- AIR_E[!le]
AIR_E

WATER_E <- as.numeric(WATER_E)
lw <- is.na(WATER_E)
WATER_E <- WATER_E[!lw]
WATER_E

NOX_pt <- as.numeric(NOX_pt)
nx <- is.na(NOX_pt)
NOX_pt <- NOX_pt[!nx]
NOX_pt

SO2_pt <- as.numeric(SO2_pt)
s2 <- is.na(SO2_pt)
SO2_pt <- SO2_pt[!s2]
SO2_pt

OZONE_pt <- as.numeric(OZONE_pt)
oz <- is.na(OZONE_pt)
OZONE_pt <- OZONE_pt[!oz]
OZONE_pt

WQI_pt <- as.numeric(WQI_pt)
wq <- is.na(WQI_pt)
WQI_pt <- WQI_pt[!wq]
WQI_pt

CLIMATE <- as.numeric(CLIMATE)
cl <- is.na(CLIMATE)
CLIMATE <- CLIMATE[!cl]
CLIMATE

AGRICULTURE <- as.numeric(AGRICULTURE)
ag <- is.na(AGRICULTURE)
AGRICULTURE <- AGRICULTURE[!ag]
AGRICULTURE

FISHERIES <- as.numeric(FISHERIES)
fi <- is.na(FISHERIES)
FISHERIES <- FISHERIES[!fi]
FISHERIES

NMVOC_pt <- as.numeric(NMVOC_pt)
nm <- is.na(NMVOC_pt)
NMVOC_pt <- NMVOC_pt[!nm]
NMVOC_pt

ENVHEALTH <- as.numeric(ENVHEALTH)
en <- is.na(ENVHEALTH)
ENVHEALTH <- ENVHEALTH[!en]
ENVHEALTH

ECOSYSTEM <- as.numeric(ECOSYSTEM)
ec <- is.na(ECOSYSTEM)
ECOSYSTEM <- ECOSYSTEM[!ec]
ECOSYSTEM

#generate central tendency (median and mean) of values for the following variables
summary(AIR_E)
summary(WATER_E)
summary(NOX_pt)
summary(SO2_pt)
summary(CLIMATE)
summary(AGRICULTURE)

#generate central tendency(mode) of values for the following variables
Mode(AIR_E)
Mode(WATER_E)
Mode(NOX_pt)
Mode(SO2_pt)
Mode(CLIMATE)
Mode(AGRICULTURE)

#generate the Boxplots for the following variables
boxplot(AIR_E)
boxplot(WATER_E)
boxplot(OZONE_pt)
boxplot(WQI_pt)
boxplot(FISHERIES)
boxplot(NMVOC_pt)
boxplot(ENVHEALTH,ECOSYSTEM)
qqplot(ENVHEALTH,ECOSYSTEM)


