library(data.table)
wd <- "/Users/ralsmith/Code/R/ExData_Plotting1"
setwd(wd)
fileLoc <- "./household_power_consumption.txt"
data <- fread(fileLoc, na.strings=c("?","","NA"), colClasses=c("Date","Date","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)
sample <- data[data$Date == as.Date("2007-02-01","%Y-%m-%d") | data$Date == as.Date("2007-02-02","%Y-%m-%d"),]
png("./plot1.png")
hist(sample$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()