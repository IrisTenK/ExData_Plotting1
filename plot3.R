# Load libraries
library(dplyr)
library(lubridate)

# First we download the data before we can follow the necessary steps for making the data tidy
filename <- "exdata-data-household_power_consumption.zip"

# Checking if the file already exists.
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileURL, filename, method="curl")
  unzip(filename)
}

power_consumption <- read.csv("household_power_consumption.txt", sep=";")

# Change data types and filter based on the dates in the assignment on Coursera
power_consumption2 <- power_consumption %>%
  mutate(Date = (as.Date(Date, "%d/%m/%Y"))) %>%
  mutate(Global_active_power = as.numeric(Global_active_power)) %>%
  mutate(DateTime = as.POSIXct((paste(Date, Time)))) %>%
  filter(Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

# Save histogram as a .png file
png(file = "plot3.png", width = 480, height = 480)

# Here we make the lineplot of the submetering 1, 2 and 3.
with(power_consumption3, plot(x = DateTime, y=Sub_metering_1, type = "l", 
                              xlab = "", 
                              ylab = "Global Active Power (kilowatts)"))

lines(power_consumption3$DateTime, power_consumption3$Sub_metering_2, type = "l", col = "red")
lines(power_consumption3$DateTime, power_consumption3$Sub_metering_3, type = "l", col = "blue")


legend("topright", 
       legend = c("Sub_metering _1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"),
       pch = " ", lty = 1)

# End PNG device
dev.off()
