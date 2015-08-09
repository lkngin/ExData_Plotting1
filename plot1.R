## Load Data
load_Data <- read.csv("./household_power_consumption.txt", 
                      header=T, 
                      sep=';', 
                      na.strings="?", 
                      nrows=2075259, 
                      check.names=F, 
                      stringsAsFactors=F, 
                      comment.char="", 
                      quote='\"')

load_Data$Date <- as.Date(load_Data$Date, format="%d/%m/%Y")

## Subsetting the data
data <- subset(load_Data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

rm(load_Data)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 1
hist(data$Global_active_power, 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", 
     col="Red")

## Save to file
dev.copy(png, 
         file="plot1.png",
         height=480, 
         width=480)

dev.off()