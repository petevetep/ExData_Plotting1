#read the datafile according data format 
orig_data <- read.table("household_power_consumption.txt",
                    sep=";", 
                    header=TRUE,
                    as.is=c(1,2),
                    na.strings="?",
                    nrows=100000)

data <- orig_data[orig_data$Date == "1/2/2007" | 
                 orig_data$Date == "2/2/2007",]
time <- strptime(paste(data$Date,adata$Time),
                 "%d/%m/%Y %H:%M:%S"
                 )


png(filename="plot3.png", width=480, height=480)

plot(time,adata$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(time,adata$Sub_metering_2,col="red")
lines(time,adata$Sub_metering_3,col="blue")
legend("topright",names(adata)[7:9],col=c("black","red","blue"),pch=c("-"))

dev.off()
