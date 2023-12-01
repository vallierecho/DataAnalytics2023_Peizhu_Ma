#Normality Test
#get familiar with Shapiro-Wilk test: used to assess whether a sample data comes from normal distribution
#explain the distributions using shapiro.test() with variables of ENVHEALTH/ ECOSYSTEM

EPI_data
View(EPI_data)
attach(EPI_data)

ENVHEALTH
ECOSYSTEM
DALY
AIR_H
WATER_H

help("shapiro.test")

hist(ENVHEALTH)
hist(ECOSYSTEM)
hist(DALY)
hist(AIR_H)
hist(WATER_H)

shapiro.test(ENVHEALTH)#P value is below than 0.05(significance level), so the null hypothesis is rejected
shapiro.test(ECOSYSTEM)#P value is below than 0.05(significance level), so the null hypothesis is rejected
shapiro.test(DALY)#P value is below than 0.05(significance level), so the null hypothesis is rejected
shapiro.test(AIR_H)#P value is below than 0.05(significance level), so the null hypothesis is rejected
shapiro.test(WATER_H)#P value is below than 0.05(significance level), so the null hypothesis is rejected

# 2010EPI dataset 
EPI2010_data <- read.csv(file.choose())
View(EPI2010_data)
names(EPI2010_data) <- EPI2010_data[1,]
names(EPI2010_data)
EPI2010_data <- EPI2010_data[-1,]

EPI2010_data$ENVHEALTH <- as.numeric(EPI2010_data$ENVHEALTH)
en <- is.na(EPI2010_data$ENVHEALTH)
EPI2010_ENVHEALTH <- EPI2010_data$ENVHEALTH[!en]

EPI2010_data$DALY <- as.numeric(EPI2010_data$DALY)
da <- is.na(EPI2010_data$DALY)
EPI2010_DALY <- EPI2010_data$DALY[!da]

EPI2010_data$AIR_H <- as.numeric(EPI2010_data$AIR_H)
ai <- is.na(EPI2010_data$AIR_H)
EPI2010_AIR_H <- EPI2010_data$AIR_H[!ai]

EPI2010_data$WATER_H <- as.numeric(EPI2010_data$WATER_H)
wa <- is.na(EPI2010_data$WATER_H)
EPI2010_WATER_H <- EPI2010_data$WATER_H[!wa]

EPI2010_ENVHEALTH
EPI2010_DALY
EPI2010_AIR_H
EPI2010_WATER_H

hist(EPI2010_ENVHEALTH)
hist(EPI2010_DALY)
hist(EPI2010_AIR_H)
hist(EPI2010_WATER_H)

qqnorm(EPI2010_ENVHEALTH)
shapiro.test(EPI2010_ENVHEALTH)#P value is below than 0.05(significance level), so the null hypothesis is rejected
shapiro.test(EPI2010_DALY)#P value is below than 0.05(significance level), so the null hypothesis is rejected
shapiro.test(EPI2010_AIR_H)#P value is below than 0.05(significance level), so the null hypothesis is rejected
shapiro.test(EPI2010_WATER_H)#P value is below than 0.05(significance level), so the null hypothesis is rejected

