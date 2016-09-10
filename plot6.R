#Course 4/Week 4 - Assignment
#
##   plot6.R
##
## September, 2016
## Julie Foster

#  Question 6:  Compare emissions from motor vehicle sources in Baltimore City
#   with emissions from motor vehicle sources in Los Angeles (fips == "06037").
#   Which city has seen greater changes over time?

# Read in the data and subset to motor vehicle sources and Baltimore City and LA
#NEI <- readRDS("./data/summarySCC_PM25.rds")
#SCC <- readRDS("./data/Source_Classification_Code.rds")
subSCC <- subset(SCC, select=c(SCC, EI.Sector))
vehicles <- subSCC[grep("Vehicles$", subSCC$EI.Sector), ]
subNEI <- NEI[NEI$SCC %in% vehicles$SCC, ]
subNEIcity <- subset(subNEI, fips == "24510" | fips == "06037")

library(plyr)
subNEIcity$city <- mapvalues(subNEIcity$fips, from = c("24510", "06037"), 
                             to = c("Baltimore City", "Los Angeles"))

library(ggplot2)

# Create plot
png(file="plot6.png", width= 480, height = 480)

g <- ggplot(subNEIcity, aes(year, Emissions))
g + geom_point() + facet_grid(city~.) + geom_smooth(method = "lm", se=FALSE) + labs(title="Emissions from Motor Vehicle Sources") + labs(x="Year")

dev.off()