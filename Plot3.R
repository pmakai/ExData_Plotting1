#Assignment Exploratory data anlysis

#Plot 3

#Reading in the file
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
d <- read.table(unz(temp, "household_power_consumption.txt"), sep=";", header=TRUE)
unlink(temp)



d$Date1<-as.Date(d$Date, format="%d/%m/%Y")
d$Date1<-as.Date(d$Date1)

d$x <- paste(d$Date, d$Time)
d$datetime<-strptime(d$x, format="%d/%m/%Y %H:%M:%S")

#Selecting on specific dates
d1<-subset(d, (Date1 == as.Date("2007-02-01") | Date1 ==  as.Date("2007-02-02")))

#Change to numeric
d$Global_active_power<-as.numeric(as.character(d$Global_active_power))

#Setting the system to English
Sys.setlocale("LC_TIME", "C")

#plot 3

png(filename="C:/Peti/plot3.png")
plot(d1$datetime,d1$Sub_metering_1, type="l", ylab="Energy Sub Metering", xlab=" ")
lines(d1$datetime,d1$Sub_metering_2, type="l", col="red")
lines(d1$datetime,d1$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd=2, col=c("black","red", "blue"))
dev.off()