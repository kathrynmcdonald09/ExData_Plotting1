install.packages("data.table")
library("data.table")
getwd()
setwd("C:/Users/kathrynmcdonald/Desktop/Desktop Working Directory")
getwd()
list.files("C:/Users/kathrynmcdonald/Desktop/Desktop Working Directory")
unzip("exdata_data_household_power_consumption.zip")
##read full data
alldata<-read.csv("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")
names(alldata)

##read subset within date range
subsetdata <- subset(alldata, Date %in% c("1/2/2007", "2/2/2007"))
subsetdata$Date <- as.Date(subsetdata$Date, format="%d/%m/%Y")

##Date / Time subset
subsetdata1 <- paste(as.Date(subsetdata$Date), subsetdata$Time)
subsetdata$subsetdata1 <- as.POSIXct(subsetdata1)

## Plot 2
with(subsetdata, {
  plot(Global_active_power~subsetdata1, type="l",
  ylab="Global Active Power (kilowatts)", xlab="")
  })

##Export
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()