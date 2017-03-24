####Change File Path to your file path
wd <- "~/Desktop/r/sabina/v1"
setwd(wd)
getwd()

##load this library.  You need to install it first.  
###In your terminal type install.packages(plyr) - Pick a mirror from the list. 
###Then run the following line to get the package running in your dataframe.
library(plyr)

###Make a CSV from your data called data.csv OR name it something else but make sure to change "data.csv"
data <- read.csv("data.csv")

###this gets the last number based on UWI
last_by_id <- ddply(data, .(UWI), tail, 1)

###This gets the head - Commented because you need to subset based on greater than 85 first

###Subset the data First#### then - last_by_id <- ddply(data, .(UWI), head, 1)


###Next steps, join the data based on UWI and use subtraction.