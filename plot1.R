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
png(file = "plot1.png", width = 480, height = 480)
  
# Make sure that frequencies are not displayed in scientific notation (to display full numbers on y-axis)
options(scipen = 999)

# Create a histogram with frequencies
hist(power_consumption2$Global_active_power, 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency", 
     col = "red", border = "black")

# End PNG device
dev.off()
