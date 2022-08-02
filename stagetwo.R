#function to carry out mathematical operations and returns the value
AddandSub <- function(x,y) {
  #passing the sum of numbers to add
  Add <- x + y
  #passing the substraction of numbers to Sub
  Sub <- x - y
  #Passing the multiplication of numbers to mut
  mut <- x * y
  #Passing the division of numbers to div
  div <- x / y
  return(c(Sub, Add, mut, div))
}

#Testing the function
AddandSub(10,4)

#To calculate and print out the product of 31 and 78
AddandSub(31,78)[3]
#To calculate and print out the division of 697 and 41
AddandSub(697,41)[4]
#To calculate and print out the addition of 314 and 654
AddandSub(314,654)[2]
#To calculate and print out the substraction of 56765 and 23
AddandSub(56765,23)[1]

#assign 39 to x
x <- 39
#assign 14 to y
y <- 14
#assign x - y to z
z = x - y
#the value of z
z

#To calculate the square root and return the log2 value
Slog <- function(x) {
  #passing the square root value to squ
  squ <- sqrt(x)
  #passing the log2 value of squ to loog
  loog <- log2(squ)
  
  return (c(squ,loog))
}

#To calculate the square root of 2345
Slog(2345)[1]

#calculate the log2 value of the square root value
Slog(2345)[2]

#vector vec1 containing some set of numbers
vec1 <- c(2,5,8,12,16)

#using seq() to create a variable num of 100 values with a step of 3
num <- seq(2,300,3)

#To print num at postion 5
num[5]

#To print num at position 10
num[10]

#To print num at position 15
num[15]

#To print num at position 20
num[20]

#To print num at position 100
num[100]

#To extract values at position 10 to 30
num[10:30]

#Asigning values to mouse_weight and mouse_color
mouse_weight <- c(23,21,18,16)
mouse_color <- c('purple','red','yellow','brown')

#Creating a dataframe
mouse_info <- data.frame('color'=mouse_color,'weight'=mouse_weight)
View(mouse_info)

#Reading and Assigning the small_file.txt to my_table
read.table('https://raw.githubusercontent.com/HackBio-Internship/public_datasets/main/R/small_file.txt')
my_table <- read.table('https://raw.githubusercontent.com/HackBio-Internship/public_datasets/main/R/small_file.txt')

#Viewing my_table
View(my_table)

#Reading and assigning to the child_variant dataset using read.csv
Child_variant <- read.csv('https://github.com/HackBio-Internship/public_datasets/blob/main/R/Child_Variants.csv?raw=true')
#Viewing the Child_variant
View(Child_variant)

#assigning the head of the dataset to head_of_child and viewing it
head_of_child <- head(Child_variant,5)
View(head_of_child)

#Obtaining and assigning the mutantRead values to the Mutant_Values 
Mutant_values <- Child_variant$MutantReadPercent
#Calculating the mean of the Mutant_Values
mean(Mutant_values)

#Extracting a new dataset based upon MutantReads score > or = 70
new_data <- Child_variant[Child_variant$MutantReadPercent >= 70,]
#Viewing the data
View(new_data)

#Download the iris dataset
iris_data <- read.csv('https://gist.github.com/curran/a08a1080b88344b0c8a7/raw/0e7a9b0a5d22642a06d3d5b9bcbad9890c8ee534/iris.csv')
#Viewing the head of the dataset
head(iris_data)

#Plot to visualize the sepals length and width according to species
plot(iris_data$sepal_length,iris_data$sepal_width,pch=19,
     main='Sepal Length Vs Width',xlab='Sepal Length',
     ylab='Sepal Width',col=factor(iris_data$species),
     xlim=c(4,8.5),ylim=c(1.8,5.5))

#Inserting legends to the plot
legend('topright',legend=c('setosa','verisicolor','virginica'),pch=19,col=1:3)

#From the plots, The specie with the shorter petal length and 
#longer speal width is the setosa specie.
#The specie with the longer sepal length and shorter Sepal
#width is the Virginica specie

plot(iris_data$petal_length,iris_data$petal_width,pch=19,
     main='petal Length Vs Width',xlab='Sepal Length',
     ylab='Sepal Width',col=factor(iris_data$species),
     xlim=c(1,7),ylim=c(0,2.5))

#Inserting legends to the plot
legend('bottomright',legend=c('setosa','verisicolor','virginica'),pch=19,col=1:3)

#From the plots, the species with the shorter petal length and
#width is the setosa specie. While the species with the longer
#petal length and width is the virginica family

#Using pairs() to get the most correlated variable
#extracting the numeric data from the data set and 
#assigning to the p_data variable
p_data <- iris_data[1:4]
#using pairs() on the p_data
pairs(p_data)
#The most coorelated column is the sepal_length column following
#by the sepal_width column