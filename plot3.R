data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";")[66638:69517,]


Sys.setlocale("LC_TIME", "English")
data$Newdate<-paste(data$Date, data$Time)
data$Newdate<-strptime(data$Newdate, "%d/%m/%Y %H:%M:%S")
x<-data$Newdate
data$Sub_metering_1<-as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_3<-as.numeric(as.character(data$Sub_metering_3))
data$Sub_metering_2<-as.numeric(as.character(data$Sub_metering_2))
png("plot3.png")
par(mfrow=c(1, 1))
plot(x, data$Sub_metering_1, type="l", lwd=.05, ylab="Energy Sub Metering", xlab="")
lines(x, data$Sub_metering_2, type="l", col="red",lwd=.05)
lines(x, data$Sub_metering_3, type="l", col="blue", lwd=.05)
legend("topright", lwd= 1,bty="n", col=c("black", "red", "blue"), legend=c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"))
dev.off()