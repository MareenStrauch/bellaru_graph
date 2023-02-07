## demo of k-means clustering...

# Load readxl package

#before in line 13

install.packages("dplyr")
install.packages("tidyverse")
install.packages("readxl")
install.packages("vctrs")
install.packages("ggplot2")
install.packages("plotly")

library(readxl)
library(plotly)
library(tidyverse)
library(dplyr)

df = read_xlsx("/Users/mareenstrauch/webapps/bellaru_graph/value_rb_light_4.xlsx", skip = 1)
df = tibble::column_to_rownames(df, var = "labels")
df$cluster = factor(kmeans(df,2)$cluster)

fig1 <- plot_ly(df, x=~x, y=~y, 
             z=~z, color=~cluster) %>%

print (df)

plot(1:24, 1:24)   

#print length of x
length(df$x)

#print length of y
length(df$y)

#print length of z
length(df)

#check if length of x and y are equal
length(df$x) == length(df$y)


#create scatterplot of first 4 pairwise values of x vs. y
plot(df$x, df$y[1:length(df$x)])

ggplot( df )+
  geom_text( aes_string( x1 , x2 , label = y , colour = factor(y)))
#ggplot( df )+
#  geom_text( aes( x, y , z, label = y , colour = factor(y)))



## Step 2: show the data without clustering
plot(value_rb_light_4)                                   # Apply plot function
 

## Step 3: show the data with the known clusters (this is just so we
## can see how well k-means clustering recreates the original clusters we
## created in step 1)
colors <- as.factor(c(
  rep("R", times=50),
  rep("Light", times=50))))
plot(x, col=colors)

## Step 3: cluster the data
## NOTE: nstart=25, so kmeans() will cluster using 25 different starting points
## and return the best cluster.
(cl <- kmeans(x, centers=2, nstart=25)) 

## Step 4: plot the data, coloring the points with the clusters
plot(x, col = cl$cluster)

