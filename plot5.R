#Course 4/Week 4 - Assignment
#
##   plot5.R
##
## September, 2016
## Julie Foster

#  Question 5:  How have emissions from motor vehicle sources changed between 
#   1999-2008 in Baltimore City?

# Read in the data and subset to motor vehicle sources and Baltimore City
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")
subSCC <- subset(SCC, select=c(SCC, EI.Sector))
vehicles <- subSCC[grep("Vehicles$", subSCC$EI.Sector), ]
subNEI <- NEI[NEI$SCC %in% vehicles$SCC, ]
balt <- subset(subNEI, fips == "24510")
VehiclePm <- tapply(balt$Emissions, balt$year, sum)


# Create plot
png(file="plot5.png", width= 480, height = 480)
plot(names(VehiclePm), VehiclePm, type = "o", xlab = "Year", ylab = "PM2.5 Emissions", pch = 19, col = "blue")
title(main="Emissions from Vehicle Sources in Baltimore City") 
dev.off()
