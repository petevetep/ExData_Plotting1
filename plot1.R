#read the datafile according data format 
#edata <- read.table("household_power_consumption.txt",
#                    sep=";", 
#                    header=TRUE,
#                    as.is=c(1,2),
#                    na.strings="?",
#                    nrows=100000)

adata <- edata[edata$Date == "1/2/2007" | 
                 edata$Date == "2/2/2007",]

# x <- seq(0,max(adata$Global_active_power),by=0.5)
# y <- c() 
# for (i in seq(1,length(x))) { 
#   y[i] <- nrow(adata[adata$Global_active_power >= x[i] & 
#                        adata$Global_active_power < x[i]+0.5,]
#                )
# }
png(filename="plot1.png", width=480, height=480)
h <- hist(adata$Global_active_power,
          breaks=20,freq=TRUE,
          plot=TRUE,
          col="red",
          main="Global Active Power",
          xlab="Global Active Power (kilowatts)", 
          ylab="Frequency" 
          )
dev.off()
