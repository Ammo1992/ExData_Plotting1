#PLOT 1

#loading the data in a data table
library(data.table)

doc<-data.table::fread("household_power_consumption.txt",na.strings = "?")

#creating a different column havinng time stored as POSIXct
doc[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

#extracting the required data of the specific dates as given in the question
doc<-doc[(doc$dateTime>="2007-02-01") & (doc$dateTime<"2007-02-03")]

#creating a png graphic device named plot1.png
png("plot1.png",width = 480,height = 480)

#plotting a histogram on the graphic device
hist(doc$Global_active_power,col = "red",xlim = c(0,6),main = "Global Active Power",xlab = "Global Active Power (kilowatts)",ylab = "Frequency")

#closing the graphic device
dev.off()
