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
#NEI <- readRDS("./data/summarySCC_PM25.rds")

# Create plot
png(file="plot1.png", width= 480, height = 480)

plot(NEI$year, NEI$Emissions, xlab="Year", ylab="Emissions", ylim=c(0,12000))
title(main="Total PM2.5 Emissions in the U.S.")
model <- lm(Emissions~year, NEI)
abline(model, col="red", lwd=2)


dev.off()