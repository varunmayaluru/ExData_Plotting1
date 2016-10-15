
# Setting working directory

setwd("~/Coursera/4. Exploratory Data Analysis/Week 1")

# Load data

unzip("exdata%2Fdata%2Fhousehold_power_consumption.zip")

library(data.table)

dataset <- fread("household_power_consumption.txt", sep = ";", header = T, stringsAsFactors = F,
                 na.strings = c(NA,"","?"), data.table = F)

# subset data as per requirement

subset <- dataset[dataset$Date %in% c("1/2/2007","2/2/2007"),]

# Create datetime as combination of Date and Time

subset$date_time <- strptime(paste(subset$Date,subset$Time,sep = ""),
                             format = "%d/%m/%Y %H:%M:%S")

# Scatter plot

png("plot2.png", width=480, height=480)

with(subset,plot(date_time, Global_active_power, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)"))

dev.off()














