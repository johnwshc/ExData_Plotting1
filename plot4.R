# 

# Household power consumption data URL

furl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
flocal <- "./data/hpconsumption.zip"
download.file(furl,flocal)

#unzip downloaded file

unzip(flocal,exdir="./data")

#list.files("./data")

#construct a data frame for data file.

# [1] "household_power_consumption.txt" "hpconsumption.zip"

f_db <- "./data/household_power_consumption.txt"

df_data <- read.table(f_db,header = TRUE,sep = ";", na.strings = "?", stringsAsFactors = FALSE)

#subset for 2 day period 2007-02-01 and 2007-02-02

feb_data <- df_data[df_data$Date %in% c("1/2/2007","2/2/2007") ,]

#head(feb_data)
#str(feb_data)

meter_one <- as.numeric(feb_data$Sub_metering_1)
meter_two <- as.numeric(feb_data$Sub_metering_2)
meter_three <- as.numeric(feb_data$Sub_metering_3)

dtime <- strptime(paste(feb_data$Date, feb_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global_active_power <- feb_data$Global_active_power

global_reactive_power <- feb_data$Global_reactive_power
volts <- feb_data$Voltage


png("plot4.png", width=480, height=480)

# 4 graphs, 2 rows, 2 columns
par(mfrow = c(2, 2)) 

plot(dtime, global_active_power, type="l",  ylab="Global Active Power", cex=0.2)

plot(dtime, volts, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, meter_one, type="l", ylab="Energy Submetering", xlab="")
lines(dtime, meter_two, type="l", col="red")
lines(dtime, meter_three, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(dtime, global_reactive_power, type="l", xlab="date-time", ylab="Global_reactive_power")

dev.off()