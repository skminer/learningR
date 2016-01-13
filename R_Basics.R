#### Data Structures #### 


#### vector: 1d ####
# c(): combine
a1 <- c(1,2,3,4,5)
a1
length(a1)
# subsetting
a1[2]
a1[2:4]
a1[-2]
a1[-c(3,5)]

a2 <- 1:5 # creating sequence 
a2

a3 <- seq(1,5)
a3
?seq
seq(1,5,2) # seq(from=1,to=5,by=2)

a4 <- rep(5,2) # rep(5, times=2)
a4

a5 <- rep(6:7, 2)
a5

?rep
a6 <- rep(6:7, each = 2)
a6

a <- c(a2, a4, a5)
a
length(a)
class(a)

# sequence
seq(0,100,25) 
seq(0,100,length.out = 5) # length for the output sequence 

# recycling rule
b1 <- seq(1,10, by=2) # seq(1,10,2)
b1

b2 <- 1:10
b2

b3 <- b1 + b2
b3

b4 <- b2/b1
b4
b4 <- round(b4, 2) # round(b4, digits=2)
?round
cbind(b1, b2, b3, b4) # cbind(): combine by column

# comparing vectors 
i <- 3
i == 3 # == : test for equality -> returns boolean value
i == pi 
i > 3 # > : bigger than
i >= 3 # >= : bigger or equal to 
i <= 3 # <= : smaller or equal to 
i < 3 # < :smaller than

i1 <- c(0,1,1,2,3, pi,4,5)
i2 <- c(0,1,0,2,3,pi,pi,5)
i1 == i2
i1 != i2 # != : not equal to 
i1 < i2
i1 <= i2
i1 > i2
i1 >= i2
which(i1==pi) # which() 
i1[6]
any(i1==pi) # returns TRUE if any value of i1 equals pi
all(i1==pi) # returns TRUE is all value of i1 are pi 

i3 <- 1:100
i3 < 3 # TRUE whenever i3 is less than 3
i3[i3<3] 
i3[i3 %% 2 == 0] # return even number elements
i3[i3>median(i3)] # select all elements greater than the median 
i3[(i3<quantile(i3,0.05))|(i3>quantile(i3,0.95))] # select all elements in the lower and upper 5% 
i3[abs(i3-mean(i3)) > sd(i3)] # select all elements that exceed one sd from the mean 

# vector arithmetic
i4 <- 1:5
i5 <- 11:15
i4 + i5
i5-i4
i4*i5
i5/i4
i5^i4
sqrt(i4)
log(i4)
log10(i4)
sin(i4)
cos(i4)
tan(i4)

#### List: id, vector #### 
mylist <- list(name="John", age=24, myvector)
mylist


#### Matrix: 2d, Homogeneous ####
# ?matrix
mat1 <- matrix(c(1:10,rep(1:5,2),seq(1,20, by=2)), nrow=10, ncol=3,
               byrow = TRUE, dimnames = list(c(letters[1:10]),c("one","two","three")))
mat1
class(mat1)
dim(mat1)
# dim(mat1) <- c(3,10)
mat1[1,] # index by row
mat1[,1] # index by column
mat1[3,3]
mat1[1:5,] # index first five rows
mat1[c(1,3),] # index first and third rows 
mat1[c(1,3), 2:3] # index second and third columns from first and third rows 
mat1[,3] <- sample(c(0,1),10,replace=TRUE) # replace column with new values
# ?sample
mat1
mat1[8,3] <- c(10)

mat2 <- t(mat1) # t(): transpose 
mat2


#### Factors ####
# ?factor
# a factor is a vector object used to specify a discrete classification of the 
# components of other vectors of the same length.
# level: each unique value in a vector
alphabet1 <- factor(LETTERS)
alphabet1

alphabet2 <- factor(LETTERS[1:10])
alphabet2
str(alphabet2)

alphabet3 <- factor(LETTERS[1:10], levels=LETTERS)

alphabet3
str(alphabet3)

g <- factor(c("a","b","b","a"))
g
class(g)
levels(g)
g[3] <- c("c")
levels(g) <- factor(c("a","b","c"))
levels(g); g

# or
g2 <- factor(c("a","b","b","a", levels=c("a","b","c")))
g2

#### Data Frame: 2d, Heterogeneous ####
name <- c("Ellie","Taylor","Luke","Drake")
gender <- c("Female","Female","Male","Male")
age <- c(20,25,26,23)
weight <- c(50,55,70,75)
friends <- data.frame(name,gender,age,weight)
friends
str(friends)
class(friends)
summary(friends)
colnames(friends)
friends$name
friends[,1]
friends[1,]
friends2 <- cbind(friends, data.frame(year=c(2,5,7,3)))
friends2

# stringsAsFactors = FALSE : not transform character into factor
# friends1 <- data.frame(name,gender,age,weight, stringsAsFactors = FALSE)
# str(friends1)


#### Iris data ####
data(iris)
str(iris)
head(iris)
head(iris,10)
tail(iris)
View(iris)

mytable <- table(iris$Species) # table()
mytable
mytable[2]

# draw samples
irissample <- sample(1:nrow(iris),10) # nrow(): number of rows 
irissample
iris[irissample,]
# different ways of indexing
iris[10:20, "Sepal.Length"]
iris[10:20, 1]
iris$Sepal.Length[10:20]


# subset
setosa1 <- subset(iris, Species = "setosa")
head(setosa1)
setosa2 <- iris[iris$Species == "setosa",]
setosa3 <- iris[which(iris$Species == "setosa"),]

iris2 <- subset(iris, select=-c(Sepal.Length, Species))
head(iris2)
# setosavirgnica <- iris[which(iris$Species %in% c("setosa","virginica")),]
# str(setosavirgnica)

# explore variables 
# summary(): distributions for numeric variables, frequency for categorical variables 
summary(iris)
quantile(iris$Sepal.Length)
quantile(iris$Sepal.Length, c(0.1,0.5,0.9)) # designate quartiles
var(iris$Sepal.Length) # variance of Sepal.Length
# histogram
hist(iris$Sepal.Length) # distribution 
hist(iris$Sepal.Length, breaks=20) # specify number of bins with breaks
install.packages("ggplot2")
library(ggplot2)
ggplot(iris, aes(x=Sepal.Length)) + 
  geom_histogram(binwidth=0.4, fill="white", colour="black")
# facet_grid() for histograms of multiple groups
ggplot(iris, aes(x=Sepal.Length)) +
  geom_histogram(fill="white", colour="black") +
  facet_grid(Species ~ .)
# density curve
plot(density(iris$Sepal.Length))
ggplot(iris, aes(x=Sepal.Length)) + geom_density(fill="blue", alpha=.2)
ggplot(iris, aes(x=Sepal.Length)) + geom_line(stat="density") + expand_limits(y=0)

# overlay densitivy curve and histogram
ggplot(iris, aes(x=Sepal.Length, y=..density..))+
  geom_histogram(fill="cornsilk", colour="grey60", size=.2, binwidth=.25) +
  geom_density() +
  xlim(2,10)

table(iris$Species) # table(): frequency of categorical(factor) variable
pie(table(iris$Species))
barplot(table(iris$Species))
ggplot(iris, aes(x=Species, fill=Species)) + geom_bar(width=0.7)

# explore multiple variables 
cov(iris$Sepal.Length, iris$Petal.Length) # covariance
with(iris, cov(Sepal.Length, Petal.Length)) # ?with
cov(iris[,1:4]) # covariance matrix 

cor(iris$Sepal.Length, iris$Petal.Length) # correlation
cor(iris[,1], iris[,4])
cor(iris[,1:4]) # correlation matrix 

install.packages("corrplot")
library("corrplot")
# ?corrplot
corrplot(cor(iris[, 1:4]))
corrplot(cor(iris[, 1:4]), method = "ellipse")
corrplot(cor(iris[, 1:4]), method = "number")
corrplot(cor(iris[, 1:4]), method = "number", type = "lower")


# aggregate()
?aggregate
aggregate(Sepal.Length~Species, iris,summary)
aggregate(Sepal.Length~Species, iris, mean) # mean of Sepal.Length of every Species

# boxplot: IQR(interqurtile range, 25%-75%), median, max, min
boxplot(Sepal.Length~Species, iris, xlab="Species", ylab="Sepal.Length")
# boxplot using ggplot2

ggplot(iris, aes(x=Species, y=Sepal.Length, fill=Species)) + geom_boxplot()


# scatter plot: numeric variables  
with(iris, plot(Sepal.Length, Sepal.Width, col=Species, pch=as.numeric(Species)))
plot(iris$Sepal.Length, iris$Sepal.Width, col=iris$Species, pch=as.numeric(iris$Species))
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, colour=Species))+geom_point()

# jitter to avoid overlapping points
plot(jitter(iris$Sepal.Length), jitter(iris$Sepal.Width),col=iris$Species)
# smoothScatter(): smoothed color density scatterplot (kernel density estimate)
smoothScatter(iris$Sepal.Length, iris$Sepal.Width)
# scatter plot matrix: pairwise relationships among variables  
pairs(iris) 




# 3D plots
install.packages("scatterplot3d")
library(scatterplot3d)
scatterplot3d(iris$Sepal.Width, iris$Sepal.Length, iris$Petal.Width)


# order 
x <- c(10,17,22,57,37)
sort(x)
order(x)
x[order(x)]

iris.ordered <- iris[order(iris$Sepal.Length),]
head(iris.ordered)
head(iris[order(iris$Sepal.Length, iris$Petal.Length),])


# ?apply
apply(iris[,1:4],2,mean) # {MARGIN=1: by row, MARGIN=2: by column}
# ?lapply
lapply(iris[,1:4], mean) # return list 
# ?sapply
sapply(iris[,1:4], mean) # return matrix 

levels(iris$Species)
# ?tapply
tapply(iris$Sepal.Length, iris$Species, mean) # run functions for the factor


byspecies <- split(iris, iris$Species) # return list
str(byspecies)



#### Basic Statistics ####
# ?summary
# summary(x): Min, 1QT, Median, Mean, 3QT, Max 

# mean(x)
# median(x)
# var(x)
# sd(x)
# cor(x,y)
# cov(x,y)

x <- c(0,2,3,10,25,33,46,56,87,100) 
mean(x)
median(x)
var(x)
sd(x)
y <- log(x+1)
cor(x,y)
cov(x,y)

# NA value
s <- c(0,1,2,3,5,7,NA)
mean(s) # even on NA in the vector -> function returns NA
sd(s)
mean(s, na.rm = TRUE) # na.rm=TRUE: ignores NA value 
sd(s, na.rm = TRUE)

n1 <- runif(10, min = 1, max=3)
n2 <- runif(10, 10, 14)
n3 <- runif(10, 97, 100)
df <- data.frame(n1=n1,n2=n2,n3=n3)
var(df) # covariance matrix: covariance between the columns of data frame 
cor(df) # correlation matrix
cov(df) # covariance matrix

#### Function ####
# mean(x, trim=) # 절사평균

myfunc <- function(x) {
  return (sd(x)/mean(x))
}

myfunc(1:10)

myfunc2 <- function(x) {
  y <- sd(x)/mean(x)
  y
}

myfunc2(1:10)

odd.even <- function(x){
  if (x%%2==1){
    y <- "odd"
  } else {
    y <- "even"
  }
  y
}

odd.even(10)
odd.even(11)



#### TIPS ####
# get working directory
getwd()
# set working directory 
setwd()
getwd() # see changed working directory 

# see all variables
ls()

# remove all variables
# rm(list=ls())

# install packages e.g ggplot2
install.packages("ggplot2")

# require packages
library(ggplot2) # or require(ggplot2)

# view a list of built-in datasets 
data()

# view a list of datasets in the package e.g MASS
data(package="MASS")

# load Boston data in the package MASS
data(Boston, package="MASS")

# view the list of installed packages
library()

# view the list of installed packages and version 
installed.packages()[,c("Package","Version")]

# read csv file 
# read.csv()

# write csv file 
# write.csv()


x <- c(7,9,3,6,2)
x
sort(x)
order(x)
?order
