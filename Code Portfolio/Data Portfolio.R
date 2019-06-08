# INITIAL SETUP ####

# Installing Library
install.packages("ggplot2")
library(ggplot2)

# See the Working directory
getwd()

# Set the working directory
setwd("C:/Users/ankur/OneDrive/Desktop/R Workspace")

# LOADING THE DATA ####

# Loading a .csv file
Lab5Data <- read.csv("Lab5.csv")
head(Lab5Data)

# Loading a text file
Cluster3data <- read.delim("cluster_3.txt")

# Creating a matrix

a<- c(1,2,3)
b<-c(4,5,6)
d<-c(7,8,9)

df <- cbind(a,b,d)

# Accessing a particular data point from the matrix
df[1,3]


# PREPARING THE DATA ####

# Understanding the data
str(mtcars)

# Five number summary
fivenum(mtcars$mpg)

# Remove the missing values
Quiz11data <- USArrests
Quiz11data <- na.omit(Quiz11data)

# Scaling the data
Quiz11data <- scale(Quiz11data)


# DATA WRANGLING  ####

# Crating a data frame
clusters <- data.frame(Cluster1data, Cluster2data, Cluster3data)
head(cluster)

# Dataframe to tibbles
income <- as.tibble(income)
head (income)

# Modifying the data frame
income<-mutate(income,diff=M_weekly-F_weekly)
head(income)

### Scaling and Standardizing the dataframe and removing missing values 
NoMissingData<- scale(na.omit(USArrests))
head(NoMissingData)


# BASIC OPERATIONS ####

# mean
mean(mtcars$mpg)

# operating on one column
mean(mtcars$mpg)

#trimmed mean
mean(mtcars$mpg, trim = 0.1)
median(mtcars$mpg)

#weighted mean
weighted.mean(mtcars$mpg, wt = mtcars$wt)

# Filter #
petallength<- filter(iris, iris$Species == "virginica", iris$Petal.Length > 4.5)
petallength
mean(petallength$Sepal.Length)
sd(petallength$Sepal.Width)
max(petallength$Petal.Length)

duration = faithful$eruptions 
twentyfivepercentile <- quantile(duration, c(.25)) 
round(twentyfivepercentile, 2)

#Counting values using filters
CountJan <- length(which(flights$month == 1))
CountJune <- length(which(flights$month == 6))

Sum <- CountJan  + CountJune 
Sum

data <- diamonds
head(diamonds)

countColorD <- length(which(diamonds$color == "D"))
countColorD 

# Subsetting data frames
Dec30flights <- filter(flights, month == 12, day == 30)
summary(Dec30flights)

### subsetting dataframe where there is no value
Dec30noflights <- is.na(Dec30flights$dep_delay)
sum(Dec30noflights)



# view the first few rows
head(CountJan)


# DATA VISUALIZATION ####

# Boxplot
boxplot(mtcars$mpg)

# Histogram
hist(mtcars$mpg)

# ggplot
plot5 <- ggplot(iris, aes(iris$Sepal.Length, iris$Petal.Length, color = Species))

#Drawing the scatterplot
plot5 <- plot5 + geom_point()

#Drawing the regression line
plot5 <- plot5 + geom_smooth(method = lm, se = FALSE)

#Adding the labels and title
plot5 <- plot5 + labs(title = "Relationship between Petal and Sepal length", subtitle = "Species level comparison", x = "Iris Sepal Length", y = "Iris Petal Length")

#Changing the background
plot5 <- plot5 + theme_tufte()

#Changing the position of the legend
plot5 <- plot5 + theme(legend.position = "bottom")

#viewing the plot
plot5


# Clustering ####

# Agglomerative clustering
hc2 <- agnes(Quiz11data, method = "single")
hc2$ac

#Calculating optmial number of clusters
setwd("C:/Users/ankur/OneDrive/Desktop/R Workspace")
Cluster1data <- read.delim("cluster_1.txt", header = FALSE)
Cluster2data <- read.delim("cluster_2.txt", header = FALSE)
Cluster3data <- read.delim("cluster_3.txt", header = FALSE)

clusters <- data.frame(Cluster1data , Cluster2data , Cluster3data)
head(clusters)

colnames (clusters) <- c("c1","c2", "c3")
head(clusters)

fviz_nbclust(clusters$c2 , kmeans, method = "gap_stat")+ theme_classic()

# GENERAL STATISTICAL OPERATIONS ####
duration = faithful$eruptions 
twentyfivepercentile <- quantile(duration, c(.25)) 
round(twentyfivepercentile, 2)

sd(mtcars$mpg)
IQR(mtcars$mpg)
mad(mtcars$mpg)

# PCA ####


# REGRESSION ####

#Regression
linearmodel <- lm(attractiveness ~ performance, data = Lab5Data)
summary(linearmodel)

#Independent T Test
IndependentTTest <- t.test(Lab5Data$performance ~Lab5Data$attractiveness, data = Lab5Data)
IndependentTTest


