library(lubridate)
library(dplyr)
library(plyr)

if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./data/powerdata.zip",method="curl")
unzip(zipfile = "./data/powerdata.zip", exdir="./data")
dataDownloaded <- date()

##Read in the files
list.files("./data/", recursive = TRUE)
power <- read.table("./data/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

##Format dates
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")

##Subset dates
power <- subset(power, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

##Create Histogram
hist(power$Global_active_power,col="red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")

##Save File
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
