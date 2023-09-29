## Read the data
## Note: the missing values in the dataset are denoted by the symbol "?"
PowerConsumption <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
##
## Convert the Date variable to the Date class
datePC <- as.Date(PowerConsumption$Date, "%d/%m/%Y")
#DateTime <- paste(PowerConsumption$Date, PowerConsumption$Time)
#timePC <- strptime(DateTime, "%d/%m/%Y %H:%M:%S")
##
## The two dates for analysis
selectedDates <- as.Date(c("2007-02-01", "2007-02-02"))
## Convert the selected dates to the days of the week
daysWeek <- weekdays(selectedDates)
## These two dates are "Thursday" and "Friday", respectively
##
## Get the subset of the data for the dates of the above two selected dates
PowerConsumption2 <- PowerConsumption[datePC == selectedDates[1] | datePC == selectedDates[2], ]
##
##
## Plot the figure to a PNG file
png(filename = "plot1.png", width = 480, height = 480)
## histogram
hist(PowerConsumption2$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
##
dev.off() ## close the device to save the figure
##
