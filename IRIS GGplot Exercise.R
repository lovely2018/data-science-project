# Exercises for ggplot

library(ggplot2)
?iris
names(iris)
head(iris)
df=as.data.frame(iris)
df

# Exercise 1
# Plot density chart for column Sepal Width of Iris Dataset. Hint : density().
# 
ggplot(df,aes(Sepal.Width))+
  geom_density()
# Exercise 2
# Compare Sepal.Length with Sepal.Width. Also apply Color format wrt Species
# Hint : point().
# 
ggplot(df,aes(Sepal.Length,Sepal.Width,color=Species))+
  geom_point(size=1)

# Exercise 3
# This time you have to make bar chart for Species. Also try to fill it with unique colors
# Hint : bar().
# 
ggplot(df,aes(Species))+
  geom_bar(fill=cm.colors(3),color='red')




# Exercise 4
# You Nailed it till now.
# This time, create object 'df' and save "iris" dataset to it.
# Assuming flowers dimensions are square in shape, you have to find area of sepal (lentgh * breadth) and petal(lentgh * breadth).
# Then compare the areas and use color option to differentiate wrt 'Species'
# Add title, ylab, xlab.
# Hint : mutate funtion of dplyr and bar.
# 
df=df%>%
  mutate(area_sepal=Sepal.Length * Sepal.Width,area_petal=Petal.Length * Petal.Width)
df
ggplot(df,aes(area_petal,area_sepal,fill=Species))+
  geom_area(stat='identity')
  labs(xlab = "Species", 
       ylab = "Sepal Area",
       title = "Bar Chart of Sepal Area")


ggplot(df,aes(Species,area_petal,fill=Species))+
  geom_bar(stat='identity')+geom_bar(stat='identity')+
  labs(xlab = "Species", 
       ylab = "Petal Area",
       title = "Bar Chart of Sepal Area")



