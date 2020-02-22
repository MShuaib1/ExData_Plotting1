plot(PD$Date_Time, PD$Sub_metering_1, "l", ylab = "Energy Sub Metering", xlab = "")
points(PD$Date_Time, PD$Sub_metering_2, "l", col = "red")
points(PD$Date_Time, PD$Sub_metering_3, "l", col = "blue")
legend("topright", lty = c(1,1,1), lwd = c(2,2,2), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))