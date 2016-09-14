#Course 4/Week 4 - Assignment
#
##   plot1.R
##
## September, 2016
## Julie Foster

#  Question 1:  Have total emissions from PM2.5 decreased in 
#  the United States from 1999 to 2008? 
##      Using the base plotting system, make a plot showing 
##      the total PM2.5 emission from all sources for each of 
##      the years 1999, 2002, 2005, and 2008.

# Read in the data
NEI <- readRDS("./data/summarySCC_PM25.rds")

# sum Emissions from all sources
TotalPm <- tapply(NEI$Emissions, NEI$year, sum)

# Create plot
png(file="plot1.png", width= 480, height = 480)
plot(names(TotalPm), TotalPm, type = "o", xlab = "Year", ylab = "PM2.5 Emissions", pch = 19, col = "blue")
title(main="Total PM2.5 Emissions in the U.S.")
dev.off()
