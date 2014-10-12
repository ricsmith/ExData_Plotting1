library(data.table)
wd <- "/Users/ralsmith/Code/R/ExData_Plotting1"
setwd(wd)
fileLoc <- "./household_power_consumption.txt"
data <- fread(fileLoc, na.strings=c("?","","NA"), colClasses=c("Date","Date","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)
# dt <- paste(data$Date,data$Time)
# data$Time <- strptime(data$Time, "%H:%M:%S")
sample <- data[data$Date == as.Date("2007-02-01","%Y-%m-%d") | data$Date == as.Date("2007-02-02","%Y-%m-%d"),]
png("./plot2.png")
with(sample, plot(strptime( paste(sample$Date,sample$Time), "%Y-%m-%d %H:%M:%S" ), sample$Global_active_power, type="s", ylab="Global Active Power (kilowatts)",xlab=""))
dev.off()