
ComparisonEmissionsOnRoadYear <- filter(NEI,(fips == "06037" | fips == "24510") & type == "ON-ROAD") %>% select(year, ZIP_Code = fips, Emissions) %>% group_by(year, ZIP_Code) %>% summarise(Emissions = sum(Emissions))

ggplot(ComparisonEmissionsOnRoadYear, aes(year,Emissions, color = ZIP_Code)) + geom_line(size = 2) + ggtitle("Comparison of Emissions from Motor Vehicles in \n Baltimore City, MD [24510] and Los Angeles, CA [06037]") + xlab("Year") + ylab("Total PM2.5") + ggsave("plot6.png")

