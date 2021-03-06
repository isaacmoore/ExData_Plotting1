# ----- Reading the Data -----
allData <- read.csv("household_power_consumption.txt", sep = ";", header = T, stringsAsFactors = F,na.strings="?") #read the whole .txt file
allData$Time <- strptime(paste(allData$Date, allData$Time), "%d/%m/%Y %H:%M:%S") #Convert Date and Time from allData to Date/Time Class
allData$Date <- as.Date(allData$Date, "%d/%m/%Y") #change Date to Date Class 
filterData <- as.Date(c("1/2/2007", "2/2/2007"), "%d/%m/%Y") # filter data to the dates specified
plotData <- subset(allData, Date %in% filterData) # created a variable to store data to be plotted.

# ----- Plotting the Data to a .png -----
png("plot1.png", width = 480, height = 480) #open png graphic device
hist(as.numeric(as.character(plotData$Global_active_power)), main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency") #plot the Globa_active_power
dev.off() #close the graphic device
cat("plot1.png has been save to ", getwd()) #confirm the .png has been saved to the working directory.
