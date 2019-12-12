install.packages("data.table")
library("data.table")
getwd()
setwd("C:/Users/kathrynmcdonald/Desktop/Desktop Working Directory")
getwd()
list.files("C:/Users/kathrynmcdonald/Desktop/Desktop Working Directory")
unzip("exdata_data_household_power_consumption.zip")
##read full data
alldata<-read.csv("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")
##read subset within date range
subsetdata <- subset(alldata, Date %in% c("1/2/2007", "2/2/2007"))
subsetdata$Date <- as.Date(subsetdata$Date, format="%d/%m/%Y")
##histogram
hist(subsetdata$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

##Export
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
