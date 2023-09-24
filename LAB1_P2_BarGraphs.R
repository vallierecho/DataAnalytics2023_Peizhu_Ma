#Creating Bar graphs
barplot(BOD$demand,names.arg = BOD$Time)
table(mtcars$cyl)
barplot(table(mtcars$cyl)) #generate a table of counts (table of frequencies)
mtcars$cyl
qplot(mtcars$cyl) #cyl is continuous here?
qplot(factor(mtcars$cyl)) #treat as discrete
help(qplot)
help("factor")
#Bar graph of counts
qplot(factor(cyl),data=mtcars)
ggplot(mtcars,aes(x=factor(cyl))) + geom_bar()
