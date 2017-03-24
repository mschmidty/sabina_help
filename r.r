wd <- "~/Desktop/r/sabina/v1"
setwd(wd)
getwd()

library(googleVis)

data <- read.csv('data.csv')

newData <- data[which(data$DIP>=85), ]