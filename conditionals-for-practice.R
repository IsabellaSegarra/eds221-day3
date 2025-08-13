# Basic if statement

burrito <- 2.4 #assigning an object value

#write a short if statement
if(burrito >2) {
  print("I love burritos!")
}

# An example with strings (bascially a conditional statement)
my_ships <- c("Millenium Falcon", "X-wing", "Tie-Fighter", "Death Star")
stringr::str_detect(my_ships, pattern = "r")

phrase <- "I hate burritos!"

if(stringr::str_detect(phrase, "love")) {
  print ("Big burrito fan")
}

#Basic if-else statement
pika <- 5 # storing a value to an object

if (pika >60) { #define size of mega pikas
  print("mega pika")
} else {
  print("normal pika")}

#Another example with strings

food <- "I love tacos!"

if (stringr::str_detect(food, pattern = "burritos")) {
  print("yay burritos")
} else {
  print("what are burritos?")
}

# More options with if-else if-else statements

marmot <- 2.8

if(marmot < 0.5){ #defining small marmonts
  print ("small")
} else if (marmot >= 0.5 & marmot < 3) { #defining medium marmonts
  print("medium")
} else { #everything else is a large marmot
  print("large")
}

#use the switch function to write complicated if else statements

species <- "mouse"

# all of this code is the same as several if else statements

switch(species,
       "cat" = print("meow"), #same as writing an if statement
       "dog" = print("woof"), #same as an else if statement
       "mouse" = print("squeak") #same as last else if statement
)

#see next week dplyr::case_when()

#Writing for loops

dog_names <- c("Teddy", "Khora", "Banjo", "Waffle")

#Create example for one data element to put into for loop
#version with copy/pasting
print("My dog's name is")
print(paste("My dog's name is", dog_names[1]))
print(paste("My dog's name is", dog_names[2]))

#version with a variable that I can update
pupster <- dog_names[1] #indexing for the first dog name
print(paste("My dog's name is", dog_names[pupster]))

#convert to a for loop

for(pupster in dog_names) {
  print(paste("My dog's name is", pupster))
}

# Another for loop example
#my data
mass <- seq(from = 0, to = 3, by = 0.5)

i <- mass[1]
i
new_val <- i + 2 #adding 2 to each value
print(new_val) #printing the new value

#write into a for loop
for(i in mass) {
  new_val <- i + 2
  print(new_val)
}

#practice same example with indexing
i <- 1
new_val <- mass[i] + 2
print(new_val)

#write into a for loop

for (i in seq_along(mass)) {
  new_val <- mass[i] + 2
  print(new_val)
}

# another example w/ iterating by position (indexing)
tree_height <- c(1,2,6,10)

#example for the first case
tree_height [1] + tree_height [2]

#convert into a generalization expression
i <- 1
val <- tree_height[i] + tree_height[i + 1]
print(val)

#convert into a for loop
#test out creating the sequence

seq_along(tree_height)

for (i in seq_along(tree_height)) {
  val <- tree_height[i] + tree_height[i + 1]
  print(val)
}

# For loops with conditional statements

#create a vector of animals

animal <- c("cat", "dog", "zebra", "dog", "dog")

one_animal <- animal [1]
one_animal

if (one_animal == "dog"){
  print("I love dogs!")
} else {
  print("These are other animals")
}

i <- 3
# Create the for loop with conditional statement:
for (i in seq_along(animal)) {
  if (animal[i] == "dog") {
    print("I love dogs!")
  } else
    print("These are other animals!")
}

# another for loop example with conditional statements

# animal species

species <- c("dog", "elephant", "goat", "dog", "dog", "elephant")

# and their respective ages in human years

age_human <- c(3, 8, 4, 6, 12, 18)

# Convert ages to "animal years" using the following:
# 1 human year = 7 in dog years
# 1 human year = 0.88 in elephant years
# 1 human year = 4.7 in goat years

#final for loop

for (i in seq_along(species)) {
  if(species[i] == "dog") {
    animal_age <- age_human[i]*7
  } else if (species[i] == "elephant") {
    animal_age <- age_human[i]*0.88
  } else if (species[i] == "goat"){
    animal_age <- age_human * 4.7
  }
  animal_ages[i] <- animal_age #populate empty vector
}

# allocate space for our output

animal_ages <- vector(mode = "numeric", length = length(species))

animal_ages #view the vector

#Another example of storing an output

tigers <- c(29, 34, 82)
lions <- c(2, 18, 6)

big_cats <- vector(mode = "numeric",length = length(tigers))

for (i in seq_along(tigers)) {
  big_cats[i] <- tigers[i] + lions[i]
} #sum of tigers and lions

#for loops to iterate across columns of data frame

# create vector to store values
mean_mtcars <- vector(mode = "numeric", length = ncol(mtcars))

for (i in 1:ncol(mtcars)) {
  mean_val <- mean(mtcars[[i]], na.rm = TRUE)
  mean_mtcars[i] <- mean_val
}
mean_val <- mean(mtcars[[i]], na.rm = TRUE) #single brackets give us a data frame, double brackers give us values

#to put into a for loop, replace 1 w/ i

# A for loop over columns with a condition

library(palmerpenguins)


for (i in ncol(penguins)) {
  if (is.numeric(penguins[[i]])) {
    penguin_median <- median(penguins[[i]], na.rm = TRUE)
    print(penguin_median) }
  else {
    print("data not numeric")
  }
}


#Functional programing

#apply() function iterates over columns or rows

#rewrite our for loop for finding mean values of the columns in mtcars

apply(X = mtcars, MARGIN = 2, FUN = mean)

#same as saying apply the function mean across columns

library(tidyverse)

penguin_summary <- penguins %>%
  group_by(species) %>%
  summarise(across(where(is.numeric), mean, na.rm = TRUE))

