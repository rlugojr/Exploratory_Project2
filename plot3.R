
baltimoreEmissionsByType <- aggregate(Emissions ~ year + type, baltimoreData, sum)
