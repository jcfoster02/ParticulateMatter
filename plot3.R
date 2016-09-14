#Course 4/Week 4 - Assignment
#
##   plot3.R
##
## September, 2016
## Julie Foster

#  Question 3:  Of the four types of sources indicated by the type(point,
#   nonpoint, onroad, nonroad) variable, which of these four sources have
#   seen decreases in emissions from 1999-2008 for Baltimore City?
#   Which have seen increases in emissions from 1999-2008?
##      Use the ggplot2 plotting system to make a plot answering 
##      this question.

# Read in the data and subset to Baltimore City
NEI <- readRDS("./data/summarySCC_PM25.rds")
balt <- subset(NEI, fips == "24510")

library(ggplot2)
library(plyr)

BaltEm <- ddply(balt, .(year, type), function(x) sum(x$Emissions))
names(BaltEm) <- c("Year", "Type", "Emissions")

# Create plot
png(file="plot3.png", width= 480, height = 480)
g <- ggplot(BaltEm, aes(Year, Emissions))
g + geom_line(color="blue") + facet_grid(.~Type) + labs(title="Baltimore City Emissions By Type") + labs(x="Year")
dev.off()
