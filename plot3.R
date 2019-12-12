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


##date / time
subsetdata1 <- paste(as.Date(subsetdata$Date), subsetdata$Time)
subsetdata$subsetdata1 <- as.POSIXct(subsetdata1)

## Plot 3
with(subsetdata, {
  plot (Sub_metering_1~subsetdata1, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~subsetdata1, col="Red")
  lines(Sub_metering_3~subsetdata1, col="Blue")
})

##Legend
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Export
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()