# PCA with iris dataset
data("iris")
head(iris)
# creating another dataset from iris dataset that contains the columns from 1 to 4 
irisdata1 <- iris[,1:4]
irisdata1
head(irisdata1)
principal_components <- princomp(irisdata1, cor = TRUE, score = TRUE)
summary(principal_components)
# in the summary you can see that it has four Principal Components it is becasue the input data has
# four different features.
# using the plot() function, we can plot the principal components.
plot(principal_components)
# plotting the principal_components using the a line in plot() functions 
plot(principal_components, type = "l")
# using rhw biplot() function we can plot the components
biplot(principal_components)
# PCA on Wine dataset from UCI
# Read the data using the read.table()
# Read the documentation for the UCI wine dataset, in the documentation, 
# Cvs stands for the "cultivars" (varieties) of the class of the wine,
# cultivar are similar to wine classes Pinot Noir,Shiraz,Muscat
# Goal is to identify the membership of the wine in 1 of 3 cultivars in 1 of 3 cultivars. 9
# There are 13 variables in the dataset such as Alcohol, Malic Acid, Ash, Alkalinity of Ash, Magnesium, ...
wine_data <- read.table('D:/01 RPI/MSIT/01 DADA ANALYTICS/W10/wine/wine.data', sep = ",")
# Header row is not available in the data, therefore, we need to add the variable names 
head(wine_data)

# The first variable, which is the cultivar that is used to identify the Cv1, Cv2 and Cv3 
# Cv1 represent the cultivar1, Cv2 represent the cultivar2 and Cv3 represent the cultivar3,
nrow(wine_data) # there are 178 rows
# Adding the variable names 
colnames(wine_data) <- c("Cvs", "Alcohol", 
                         "Malic_Acid", "Ash", "Alkalinity_of_Ash", 
                         "Magnesium", "Total_Phenols", "Flavanoids", "NonFlavanoid_Phenols",
                         "Proanthocyanins", "Color_Intensity", "Hue", "OD280/OD315_of_Diluted_Wine", 
                         "Proline")
head(wine_data) # Now you can see the header names.
# Using the Heatmap() function, we can check the correlations,
# In the heatmap(), the "Dark Colors" represent the "Correlated"
# In the heatmap(), the "Light Colors" represent the "Not or less Correlated"
help("heatmap") # Read the heatmap() function Documentation in RStudio.
# Now we will use the heatmap() function to show the correlation among variables.
heatmap(cor(wine_data),Rowv = NA, Colv = NA) 
# declaring the cultivar_classes using the factor() function each cultivar Cv1,Cv2 and Cv3.
cultivar_classes <- factor(wine_data$Cvs) 
cultivar_classes
# We will normalize the wine data to a common scale using scale() function so that the PCA process will not 
# overweight variables that happen to have the larger values.
# Read the documentation of scale() function in RStudio.
help(scale)
# We will not normalize the Cvs variable (first colume) so we exclude the Cvs column with with -1 
wine_data_PCA <- prcomp(scale(wine_data[,-1]))
# We can use the summary() function on wine_data_PCA to see the cumulative proportion that each 
# principal component (PC) contributes,
summary(wine_data_PCA)

