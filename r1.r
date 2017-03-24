####Change File Path to your file path
wd <- "~/Desktop/r/sabina/v1"
setwd(wd)
getwd()

##load this library.  You need to install it first.  
###In your terminal type install.packages(plyr) - Pick a mirror from the list. 
###Then run the following line to get the package running in your dataframe.
library(plyr)
library(data.table)

###Make a CSV from your data called data.csv OR name it something else but make sure to change "data.csv"
data <- read.csv("data.csv")

###greater than 85 by ID
DIP_greater <- data[which(data$DIP>=85), ]

###this gets the last number based on UWI
last_by_id <- ddply(data, .(UWI), tail, 1)

###This gets the head - Commented because you need to subset based on greater than 85 first

greater_by_id <- ddply(DIP_greater, .(UWI), head, 1)

##rename TVD for join. 
names(greater_by_id)[names(greater_by_id) == 'TVD'] <- 'TVD_GBI'

##subset both data sets so that they only have UWI and TVD for join
greater_by_id_simple<- greater_by_id[c(1,3)]
last_by_id_simple<- last_by_id[c(1,3)]

## Merge the data sets for subtraction
merged_data<- merge(greater_by_id_simple, last_by_id_simple, all=T)

##subtraction of TVD
merged_data$TVD_diff<-(merged_data$TVD - merged_data$TVD_GBI)

###SetFinal
final<-merged_data

##Write Tables to CSV
write.table(greater_by_id, file="greater_than_eightyfive.csv")
write.table(last_by_id, file="last_by_id.csv")
write.table(final, file="final.csv")

