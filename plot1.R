# reading the datafile according data format 
# nrows=100000 appeared to be enough to get all values from the desired dates  
edata <- read.table("household_power_consumption.txt",
                    sep=";", 
                    header=TRUE,
                    as.is=c(1,2),
                    na.strings="?",
                    nrows=100000)

# extracting the desired data subset 
adata <- edata[edata$Date == "1/2/2007" | 
                 edata$Date == "2/2/2007",]

# making the histogram
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
