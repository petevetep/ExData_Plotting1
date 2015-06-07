# reading the datafile according data format 
# nrows=100000 appeared to be enough to get all values from the desired dates  
orig_data <- read.table("household_power_consumption.txt",
                    sep=";", 
                    header=TRUE,
                    as.is=c(1,2),
                    na.strings="?",
                    nrows=100000)

# extracting the desired data subset 
data <- orig_data[orig_data$Date == "1/2/2007" | 
                 orig_data$Date == "2/2/2007",]

# converting strings to dates
time <- strptime(paste(data$Date,data$Time),
                 "%d/%m/%Y %H:%M:%S"
                 )

# making the plots
png(filename="plot4.png", width=480, height=480)

par(mfcol=c(2,2))

plot(time,data$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power"
)

plot(time,data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(time,data$Sub_metering_2,col="red")
lines(time,data$Sub_metering_3,col="blue")
legend("topright",names(data)[7:9],col=c("black","red","blue"),lty=c(1))

plot(time,data$Voltage,
     type="l",
     ylab="Voltage",xlab="datetime")

plot(time,data$Global_reactive_power,
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power")

dev.off()
