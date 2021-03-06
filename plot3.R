library(data.table)
wd <- "/Users/ralsmith/Code/R/ExData_Plotting1"
setwd(wd)
fileLoc <- "./household_power_consumption.txt"
data <- fread(fileLoc, na.strings=c("?","","NA"), colClasses=c("Date","Date","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)
sample <- data[data$Date == as.Date("2007-02-01","%Y-%m-%d") | data$Date == as.Date("2007-02-02","%Y-%m-%d"),]
png("./plot3.png")
with(sample, plot(strptime( paste(sample$Date,sample$Time), "%Y-%m-%d %H:%M:%S" ), sample$Sub_metering_1, type="s", ylab="Energy sub metering",xlab=""))
with(sample, points(strptime( paste(sample$Date,sample$Time), "%Y-%m-%d %H:%M:%S" ), sample$Sub_metering_2, type="s", col="red"))
with(sample, points(strptime( paste(sample$Date,sample$Time), "%Y-%m-%d %H:%M:%S" ), sample$Sub_metering_3, type="s", col="blue"))
legend("topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty=c(1,1,1), lwd=c(2.5,2.5,2.5))
dev.off()