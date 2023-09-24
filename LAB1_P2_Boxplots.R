#Creating Box-plot
plot(ToothGrowth$supp, ToothGrowth$len) #factor values(like gender:male, female) for x and vector values for y
#Formula Syntax
boxplot(len~supp,data = ToothGrowth) #~ means grouping, combine two variables on the x-axis
help("boxplot")
boxplot(len~supp + dose,data = ToothGrowth) #put intersection of two variables
qplot(supp,len,data=ToothGrowth, geom = 'boxplot') #two variable in same dataframe
qplot(interaction(ToothGrowth$supp,ToothGrowth$dose),ToothGrowth$len,geom='boxplot')
ggplot(ToothGrowth,aes(x=supp,y=len))+geom_boxplot()      
ggplot(ToothGrowth,aes(x=interaction(supp,dose),y=len)+geom_boxplot()      
       
       