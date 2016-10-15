
# Setting working directory

setwd("~/Coursera/4. Exploratory Data Analysis/Week 1")

# Load data

unzip("exdata%2Fdata%2Fhousehold_power_consumption.zip")

library(data.table)

dataset <- fread("household_power_consumption.txt", sep = ";", header = T, stringsAsFactors = F,
                 na.strings = c(NA,"","?"))

# Convert date to date format

dataset[,Date := as.Date(Date, format = "%d/%m/%Y")]

subset <- dataset[Date %in% as.Date(c("2007-02-01","2007-02-02"))]

# Plot a histogram of Global Active Power (KiloWatts)

png("plot1.png", width=480, height=480)

with(subset,hist(Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)"))

dev.off()

