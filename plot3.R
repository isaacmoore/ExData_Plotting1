# ----- Reading the Data -----
allData <- read.csv("household_power_consumption.txt", sep = ";", header = T) #read the whole .txt file
allData$Time <- strptime(paste(allData$Date, allData$Time), "%d/%m/%Y %H:%M:%S") #Convert Date and Time from allData to Date/Time Class
allData$Date <- as.Date(allData$Date, "%d/%m/%Y") #change Date to Date Class 
filterData <- as.Date(c("1/2/2007", "2/2/2007"), "%d/%m/%Y") # filter data to the dates specified
plotData <- subset(allData, Date %in% filterData) # created a variable to store data to be plotted.

# ----- Plotting the Data to a .png -----
png("plot3.png", width = 480, height = 480) #open png graphic device
#plot(plotData$Time, plotData$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
plot(plotData$Time, plotData$Sub_metering_1, col = "black", type = "l", ylab = "Energy sub metering", xlab = "")
lines(plotData$Time, plotData$Sub_metering_2, col = "red")
lines(plotData$Time, plotData$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3")) 
dev.off() #close the graphic device
cat("plot3.png has been save to ", getwd()) #confirm the .png has been saved to the working directory.
