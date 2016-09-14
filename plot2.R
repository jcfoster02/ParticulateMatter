#Course 4/Week 4 - Assignment
#
##   plot2.R
##
## September, 2016
## Julie Foster

#  Question 2:  Have total emissions from PM2.5 decreased in 
#  Baltimore City, Maryland (fips="24510") from 1999 to 2008? 
##      Use the base plotting system to make a plot answering 
##      this question.

# Read in the data and subset to Baltimore City
NEI <- readRDS("./data/summarySCC_PM25.rds")
balt <- subset(NEI, fips == "24510")
BaltEm <- tapply(balt$Emissions, balt$year, sum)

# Create plot
png(file="plot2.png", width= 480, height = 480)
plot(names(BaltEm), BaltEm, type = "o", xlab = "Year", ylab = "PM2.5 Emissions", pch = 19, col = "blue")
title(main="Total PM2.5 Emissions in Baltimore City")
dev.off()
