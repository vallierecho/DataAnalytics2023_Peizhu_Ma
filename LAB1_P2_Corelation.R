multivariate <- read.xlsx(file.choose(),sheetName = 'Sheet1')
multivariate
View(multivariate) #check the dataset
multivariate <- multivariate[1:7,1:6] #tailor the dataset to the part we need to use
multivariate
head(multivariate) #overview of the dataset
attach(multivariate)
help(lm)
mm <- lm(Homeowners~Immigrants)
mm #R object
summary(mm)
plot(Homeowners~Immigrants)
help(abline)
abline(mm)
abline(mm, col=2,lwd=2)
newlmmigrantdata <- data.frame(immigrant = c(0,20)) #predict multiple data at once
mm %>% predict(newlmmigrantdata) #pipes

abline(mm)
abline(mm,col=3,lwd=3) #line color = green, line width = 3
attributes(mm)
mm$coefficients
