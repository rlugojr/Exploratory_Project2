
baltimoreEmissionsOnRoad <- filter(baltimoreData, type == "ON-ROAD")
baltimoreEmissionsOnRoadYear <- aggregate(Emissions ~ year + type, baltimoreEmissionsOnRoad, sum)

ggplot(baltimoreEmissionsOnRoadYear, aes(year,Emissions)) + geom_line(lwd=2) + ggtitle("Emissions from Motor Vehicles in Baltimore City, MD") + xlab("Year") + ylab("Total PM2.5")
