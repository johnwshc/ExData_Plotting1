# EDA Week 1 Project

# plot1.R

# Household power consumption data URL

furl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
flocal <- "./data/hpconsumption.zip"
download.file(furl,flocal)

#unzip downloaded file

unzip(flocal,exdir="./data")

list.files("./data")

#construct a data frame for data file.



# [1] "household_power_consumption.txt" "hpconsumption.zip"

f_db <- "./data/household_power_consumption.txt"

df_data <- read.table(f_db,header = TRUE,sep = ";", na.strings = "?", stringsAsFactors = FALSE)

#subset for 2 day period 2007-02-01 and 2007-02-02



feb_data <- df_data[df_data$Date %in% c("1/2/2007","2/2/2007") ,]

head(feb_data)

f_png <- "./data/plot1.png"

png(f_png, width=480, height=480)

global_active_power <- feb_data$Global_active_power

#draw histogram
      
hist(global_active_power, main="Global Active Power", col="red",  xlab="Global Active Power (kilowatts)")

dev.off()