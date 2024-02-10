# Save histogram as a .png file
png(file = "plot4.png", width = 480, height = 480)

# Here, we make sure that there are two rows and two columns to make four plots
par(mfrow = c(2,2))

# Here we create the first plot
with(power_consumption3, plot(DateTime, Global_active_power, type = "l", 
                              xlab = "", 
                              ylab = "Global Active Power (kilowatts)",
                              cex.lab = 0.7, cex.axis = 0.7))

# Here we create the second plot
with(power_consumption3, plot(DateTime, Voltage, type = "l", 
                              xlab = "datetime", 
                              ylab = "Voltage",
                              cex.lab = 0.7, cex.axis = 0.7))

# Here we create the fouth plot
with(power_consumption3, plot(x = DateTime, y=Sub_metering_1, type = "l", 
                              xlab = "", 
                              ylab = "Global Active Power (kilowatts)",
                              cex.lab = 0.7, cex.axis = 0.7))

lines(power_consumption3$DateTime, power_consumption3$Sub_metering_2, type = "l", col = "red")
lines(power_consumption3$DateTime, power_consumption3$Sub_metering_3, type = "l", col = "blue")

legend("topright", 
       legend = c("Sub_metering _1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"),
       pch = " ", lty = 1, cex = 0.6)

with(power_consumption3, plot(DateTime, Global_reactive_power, type = "l", 
                              xlab = "datetime", 
                              cex.lab = 0.7, cex.axis = 0.7))

# End PNG device
dev.off()
     