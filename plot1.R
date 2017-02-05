
TotalByYear <- aggregate(Emissions ~ year, NEI, sum)

#ggplot(TotalByYear, aes(year, (Emissions/1000000))) + geom_line(color="green", size =2) + coord_cartesian(ylim = c(3.5,7.5)) + ylab("Total PM2.5 (Millions)") + xlab("Year") + ggtitle("Emission Levels Over Time") + ggsave("plot1.png")
png("plot1.png")

plot(TotalByYear$year, TotalByYear$Emissions/1000000, main = "Emission Levels Over Time", xlab = "Year", ylab = "Total PM2.5 (Millions)", col = "red", type = "o", ylim = c(2.5,7.5), lwd = 2)

dev.off()

print("plot1.png created")
