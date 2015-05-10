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


png(filename="plot2.png", width=480, height=480)

plot(time,data$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)"
     )

dev.off()
