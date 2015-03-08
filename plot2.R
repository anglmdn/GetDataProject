data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";")[66638:69517,]

Sys.setlocale("LC_TIME", "English")
data$Global_active_power<-as.numeric(as.character(data$Global_active_power))
data$Newdate<-paste(data$Date, data$Time)
data$Newdate<-strptime(data$Newdate, "%d/%m/%Y %H:%M:%S")
png("plot2.png")
with(data, plot(Newdate, Global_active_power, type="l",ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()