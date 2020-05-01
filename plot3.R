#PLOT 3

#loading the data in a data table
library(data.table)

doc<-data.table::fread("household_power_consumption.txt",na.strings = "?")

#creating a different column havinng time stored as POSIXct
doc[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

#extracting the required data of the specific dates as given in the question
doc<-doc[(doc$dateTime>="2007-02-01") & (doc$dateTime<"2007-02-03")]

#creating and opening a png graphic device named plot3.png
png("plot3.png",width = 480,height = 480)

#plotting the graph onto the graphic device
plot(x=doc$dateTime, y=doc$Sub_metering_1,type = "l",xlab = "",ylab = "Energy sub meeting")

#over the main plot adding the lines for other varaibles so as to represnt them in the same file
lines(x=doc$dateTime, y=doc$Sub_metering_2, col="red")

lines(x=doc$dateTime, y=doc$Sub_metering_3, col="blue")

legend("topright",col = c("black","red","blue"), c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1),lwd = c(1,1))

#closing the graphic device
dev.off()
