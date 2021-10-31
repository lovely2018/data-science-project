
# Exercises for dplyr

library(dplyr)
?iris
names(iris)
df=as.data.frame(iris)
df
# Exercise 1
# Select the first three columns of the iris dataset using their column names. HINT: Use select().
# 
select(df,"Sepal.Length" ,"Sepal.Width" , "Petal.Length" )


# Exercise 2
# Select all the columns of the iris dataset except "Petal Width". HINT: Use "-".

select(df,-Petal.Width)

  

# Exercise 3
# Select all columns of the iris dataset that start with the character string "P".

select(df,starts_with('p',ignore.case = T))



# Exercise 4
# Filter the rows of the iris dataset for Sepal.Length >= 4.6 and Petal.Width >= 0.5.
filter(df,Sepal.Length >= 4.6,Petal.Width >= 0.5)


# Exercise 5
# Pipe the iris data frame to the function that will select two columns 
#(Sepal.Width and Sepal.Length). HINT: Use pipe operator.
df%>%
  select(Sepal.Width,Sepal.Length)



# Exercise 6
# Arrange rows by a particular column, such as the Sepal.Width. HINT: Use arrange().

arrange(df,Sepal.Width)

# Exercise 7
# Select three columns from iris, arrange the rows by Sepal.Length, then arrange the rows by Sepal.Width.
df%>%
  select(Sepal.Length,Sepal.Width,Species) %>%
  arrange(Sepal.Length,Sepal.Width)


# Exercise 8
# Create a new column called proportion, which is the ratio of Sepal.Length to Sepal.Width. HINT: Use mutate().

df=mutate(df,proportion=Sepal.Length/Sepal.Width)
df

# Exercise 9
# Compute the average number of Sepal.Length, apply the mean() function to the column Sepal.Length, and call the summary value "avg_slength". HINT: Use summarize().


summarise(df,'avg_slength'=mean(Sepal.Length))

# Exercise 10
# Split the iris data frame by the Sepal.Length, then ask for the same summary statistics as above. HINT: Use group_by().
g1=group_by(df,Sepal.Length)

summarize(g1,'avg_slength'=mean(Sepal.Length),'count'=n())
