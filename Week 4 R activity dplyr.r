#Week 4: dplyr package

#Task: Write the function to get a dataset from Base R: HairEyeColor
#and give the dataset a new name of your choice
data("HairEyeColor")
newData<- HairEyeColor
newData <- as.data.frame(HairEyeColor)


#See the top rows of the data
#TASK: Write the function to see the top rows of the data
head(newData,1)


#Install and call the package dplyr
#TASK: Write the functions to install and call dplyr
install.packages("dplyr")
library("dplyr")


#Let's just see the hair and sex columns
#Task: Write the function to 'select' just the hair and sex columns 
#(hint: use the 'select' function)
select(newData,Hair,Sex)

#Let's name the dataset with just the two columns, Hair and Sex
#TASK: Write the function to save the two columns as one new dataset
#and give it a name
hairSexColumn <- select(newData,Hair,Sex)
hairSexColumn

#Let's get rid of the Sex column in the new dataset created above
#TASK: Write the function that deselects the sex column
#(hint: use the 'select' function to not select a -column)
select(hairSexColumn,-Sex)

#Let's rename a column name
#TASK: Write the function that renames 'sex' to 'gender'
rename(hairSexColumn,gender=Sex)

#Let's make a new dataset with the new column name
#TASK: Write the function that names a new dataset that includes the 'gender' column
sexColumn <- rename(hairSexColumn,gender=Sex)
sexColumn

#Let's 'filter' just the females from our dataset
#TASK: Write the function that includes only rows that are 'female'
femaleOnly <- filter(sexColumn, gender=="Female")
femaleOnly

#Let's 'group' our data by gender
#TASK: Write the function to group the data by gender (hint: group_by)
group_by(femaleOnly, gender)

#Let's see how many students were examined in the dataset (total the frequency)
#TASK: replace 'datasetname' with the name of your dataset and get the total
#TASK: After you run it, write the total here: 592
total=mutate(newData, total=cumsum(Freq))
total


#Since we have a females dataset, let's make a males dataset
#TASK: Write the function that includes only rows that are 'male'
maleOnly <- filter(sexColumn, gender=="Male")
maleOnly

#And now let's join the males and females
#TASK: Write the function that joins the male and female rows 
#(hint: try using 'union' or 'bind_rows')
union(maleOnly,femaleOnly)

#Optional Task: add any of the other functions 
#you learned about from the dplyr package
pull(maleOnly)
n_distinct(maleOnly)

