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
png(filename = "plot2.png", width = 480, height = 480)
## number of data points
numData2 <- nrow(PowerConsumption2)
##
plot(1:numData2, PowerConsumption2$Global_active_power, type = 'l',
     main = " ", xlab = " ", ylab = "Global Active Power (kilowatts)", xaxt = 'n')
## set the x-axis labels
axis(side = 1, at = c(1, numData2/2, numData2 + 1), labels = c("Thu", "Fri", "Sat"))
##
dev.off() ## close the device to save the figure
##
