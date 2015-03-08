data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";")[66638:69517,]
data$Global_active_power<-as.numeric(as.character(data$Global_active_power))
png("plot1.png")
hist(data$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.off()