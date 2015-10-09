library(data.table)
# read the data using fread
myTable <- fread("household_power_consumption.txt", stringsAsFactors = TRUE, sep = ";", na.strings = "?")
# create a new data frame/table for the period 1 to 2 Feb 2007
febData <- subset(myTable, as.Date(myTable$Date, "%d/%m/%Y") > as.Date("31/1/2007", "%d/%m/%Y") & as.Date(myTable$Date, "%d/%m/%Y") < as.Date("3/2/2007", "%d/%m/%Y"))
# convert the subset to dataframe (fread creates a data table/frame)
febData <- as.data.frame(febData)
# convert the Date variable to Date 
febData$Date <- as.Date(febData$Date, "%d/%m/%Y")
# concatenate the date and time to create a time stamp
x <- paste(febData$Date, febData$Time)
# convert the time variable to POSIXlt 
febData$Time <- strptime(x, format = "%Y-%m-%d %H:%M:%S")
#create a new png file named plot4.png
png("plot4.png", width=480, height=480)
#change the canvas to 2X2 
par(mfcol = c(2,2))
#change the margin values
par(mar = c(4,4,1,1))

#Plot1
plot(febData$Time, febData$Global_active_power, type = "n", col = "black", xlab = "", ylab = "Global Active Power")
lines(febData$Time, febData$Global_active_power, col = "black")
#Plot2
plot(febData$Time,febData$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(febData$Time, febData$Sub_metering_1, col = "black")
lines(febData$Time, febData$Sub_metering_2, col = "red")
lines(febData$Time, febData$Sub_metering_3, col = "blue")
#Plot3
plot(febData$Time, febData$Voltage, type = "n", col = "black", xlab = "datetime", ylab = "Voltage")
lines(febData$Time, febData$Voltage, col = "black")
#Plot4
plot(febData$Time, febData$Global_reactive_power, type = "n", col = "black", xlab = "datetime", ylab = "Global_reactive_power")
lines(febData$Time, febData$Global_reactive_power, col = "black")
# close device
dev.off()
