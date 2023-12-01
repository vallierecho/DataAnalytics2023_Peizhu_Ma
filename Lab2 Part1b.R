#Regression

#using the EPI dataset to find the single most important factor in increasing the EPI in a given region
EPI_data <- read.csv(file.choose())
attach(EPI_data)

boxplot(ENVHEALTH,DALY,AIR_H,WATER_H)
help("lm") #fitting linear models

DALYNEW <- DALY #to resolve the issue of the variables name of prediction value not fitting those of model value
AIR_HNEW <- AIR_H
WATER_HNEW <- WATER_H

lmENVH <- lm(ENVHEALTH~DALYNEW+AIR_HNEW+WATER_HNEW) #linear and least0-squares
Model1 <- lm(AIR_E ~ DALYNEW+AIR_HNEW+WATER_HNEW)
Model2 <- lm(CLIMATE ~DALYNEW+AIR_HNEW+WATER_HNEW)
summary(lmENVH)
cENVH <- coef(lmENVH)
summary(Model1)
cENVH <- coef(Model1)
summary(Model2)
cENVH <- coef(Model2)

DALYNEW <- c(seq(5,95,5))
AIR_HNEW <- c(seq(5,95,5))
WATER_HNEW <- c(seq(5,95,5))

NEW <- data.frame(DALYNEW,AIR_HNEW,WATER_HNEW)

pENV <- predict(lmENVH,NEW,interval = 'prediction')
cENV <- predict(lmENVH,NEW,interval = 'confidence')
pENV
cENV

#repeated exercise for AIR_E and CLIMATE
pAIR_E <- predict(Model1,NEW,interval = 'prediction')
cAIR_E <- predict(Model1,NEW,interval = 'confidence')
pAIR_E
cAIR_E

pCLIMATE <- predict(Model2,NEW,interval = 'prediction')
cCLIMATE <- predict(Model2,NEW,interval = 'confidence')
pCLIMATE
cCLIMATE




