library(data.table)
# read the data using fread
myTable <- fread("household_power_consumption.txt", stringsAsFactors = TRUE, sep = ";", na.strings = "?")
# create a new data frame/table for the period 1 to 2 Feb 2007
febData <- subset(myTable, as.Date(myTable$Date, "%d/%m/%Y") > as.Date("31/1/2007", "%d/%m/%Y") & as.Date(myTable$Date, "%d/%m/%Y") < as.Date("3/2/2007", "%d/%m/%Y"))
#create a new png file named plot1.png
png("plot1.png", width=480, height=480)
#create the histogram 
with(febData, hist(Global_active_power, col = "red", xlab = "Global Active Power (Kilowatts)", main = "Global Active Power", ylim = c(0,1200)))
# close device
dev.off()

