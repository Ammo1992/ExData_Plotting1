#PLOT 4

#loading the data in a data table
library(data.table)

doc<-data.table::fread("household_power_consumption.txt",na.strings = "?")

#creating a different column havinng time stored as POSIXct
doc[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

#extracting the required data of the specific dates as given in the question
doc<-doc[(doc$dateTime>="2007-02-01") & (doc$dateTime<"2007-02-03")]

#creating and opening a png graphic device named plot4.png
png("plot4.png",width = 480,height = 480)

#splitting the graphic device into 4 areas row wise
par(mfrow=c(2,2))

#plotting global active power vs date in topleft
plot(doc$dateTime,doc$Global_active_power,xlab = "",
     ylab = "Global Active Power",type = "l")

#plotting voltage vs date in topright
plot(doc$dateTime,doc$Voltage,xlab = "datetime",
     ylab = "Voltage",type = "l")

#plotting energy sub metering vs date in bottomleft - by adding lines to the main plot
plot(x=doc$dateTime, y=doc$Sub_metering_1,type = "l",
     xlab = "",ylab = "Energy sub meeting")

lines(x=doc$dateTime, y=doc$Sub_metering_2, col="red")

lines(x=doc$dateTime, y=doc$Sub_metering_3, col="blue")

legend("topright",col = c("black","red","blue"), 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = c(1,1),lwd = c(1,1))

#plotting global reactive power vs date in bottom right
plot(doc$dateTime,doc$Global_reactive_power,xlab = "datetime",
     ylab = "Global_reactive_power",type = "l")

#closing the graphic device
dev.off()
