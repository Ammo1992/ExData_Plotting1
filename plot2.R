#PLOT 2

#loading the data in a data table
library(data.table)
doc<-data.table::fread("household_power_consumption.txt",na.strings = "?")

#creating a different column havinng time stored as POSIXct
doc[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

#extracting the required data of the specific dates as given in the question
doc<-doc[(doc$dateTime>="2007-02-01") & (doc$dateTime<"2007-02-03")]

#creating and opening a png graphic device named plot2.png
png("plot2.png", width=480, height=480)

#plotiing a line graph onto the graphic device
plot(x = doc$dateTime, y = doc$Global_active_power
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

#closing the graphic device
dev.off()
