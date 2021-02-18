#JohnHopkins University course in 
#Exploratory data analysis with Dr Roger Peng

#COURSE PROJECT 2 ASSIGNMENT

path <- getwd()
download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
              , destfile = paste(path, "dataFiles.zip", sep = "/"))
unzip(zipfile = "dataFiles.zip")

dir() #Check if data present

file.remove("dataFiles.zip")


#Read RDS files
NEI <- readRDS("summarySCC_PM25.rds")
  #Check data
  head(NEI)
  str(NEI)
  dim(NEI)
  #View(NEI)
  
SCC<- readRDS("Source_Classification_Code.rds")
  #Check data
  head(SCC)
  str(SCC)
  dim(SCC)
  #View(SCC)



# Question 1 - PM2.5 emissions in the US from 1999 to 2008 ----------------

#Aggregate NEI emissions by year
emissionsNEI <- aggregate(Emissions ~ year, NEI, sum)
View(emissionsNEI)


#Plot "plot1.png"
png("plot1.png", width = 480, height = 480)

plot(emissionsNEI$year, emissionsNEI$Emissions/1000, type = "o", pch = 19,
     main = "U.S. PM2.5 Emissions from 1999 - 2008",
     ylab = "Aggregated emissions of PM2.5 (thousand tons)",
     xlab = "Year",
     xlim = c(1999,2008))

#Closing the png file device - back to default
dev.off()



# Question 2 - PM2.5 emissions in Baltimore City from 1999 to 2008 --------

#Baltimore --> (fips == "24510")
baltimore <- NEI[NEI$fips=="24510", ]

#Aggregate Baltimore NEI emissions by year
baltimoreNEI <- aggregate(Emissions ~ year, baltimore, sum)
View(baltimoreNEI)


#Plot "plot2.png"
png("plot2.png", width = 480, height = 480)

plot(baltimoreNEI$year, baltimoreNEI$Emissions, type = "o", pch = 19,
     main = "Baltimore City PM2.5 Emissions from 1999 - 2008",
     ylab = "Emissions of PM2.5 (tons)",
     xlab = "Year",
     xlim = c(1999,2008))

#Closing the png file device - back to default
dev.off()



# Question 3 - Total PM2.5 emissions in Baltimore City by type of sources ---
#type of sources (point, nonpoint, onroad, nonroad)

#Aggregate Baltimore NEI emissions by year & type
baltimoreType <- aggregate(Emissions ~ year + type, baltimore, sum)
View(baltimoreType)


#Plot "plot3.png"
library(ggplot2)

png("plot3.png", width = 480, height = 480)

p3 <- ggplot(baltimoreType, aes(year, Emissions, color = type))
p3 <- p3 + geom_line() +
      xlab("Year") +
      ylab("Emissions of PM2.5 (tons)") +
      ggtitle("Baltimore City PM2.5 Emissions from 1999 - 2008") +
      theme_bw() +
      theme(plot.title = element_text(hjust = 0.5))
  

print(p3)

#Closing the png file device - back to default
dev.off()



# Question 4 - Changes in Coal combustion PM2.5 emissions in the US --------

#Selecting coal sources
SCC.sub <- SCC[grepl("Coal" , SCC$Short.Name), ]
NEI.sub <- NEI[NEI$SCC %in% SCC.sub$SCC, ]


#Plot "plot4.png"
png("plot4.png", width = 400, height = 400)

p4 <- ggplot(NEI.sub, aes(factor(year), Emissions/1000, fill = type)) + 
      geom_bar(stat = "identity", width = .4) + 
      xlab("Year") +
      ylab("Emissions of PM2.5 (thousand tons)") + 
      ggtitle("Total U.S. Coal-related PM2.5 Emissions from 1999 - 2008") +
      theme_bw() +
      theme(plot.title = element_text(hjust = 0.5))

print(p4)

#Closing the png file device - back to default
dev.off()



# Question 5 - Vehicle related PM2.5 emissions in Baltimore City ----------
#Could use SCC searching for vehicle (Q4); "ON-ROAD" seems simpler

#Baltimore --> (fips == "24510")
baltimoreVehicle <- NEI[NEI$fips=="24510", ]
baltimoreVehicle <- baltimoreVehicle[baltimoreVehicle$type=="ON-ROAD", ]


#Plot "plot5.png"
png("plot5.png", width = 400, height = 400)

p5 <- ggplot(baltimoreVehicle, aes(factor(year), Emissions)) +
      geom_bar(stat = "identity", width = 0.4) + ylim(0,400) +
      xlab("Year") +
      ylab("Emissions of PM2.5 (tons)") + 
      ggtitle("Baltimore City Vehicle-related PM2.5 Emissions from 1999 - 2008") +
      theme_bw() +
      theme(plot.title = element_text(hjust = 0.5))
      

plot(p5)

#Closing the png file device - back to default
dev.off()



# Question 6 - Vehicle related PM2.5 emissions Baltimore v LA County --------

#Baltimore --> (fips == "24510")
baltimoreVehicle <- NEI[NEI$fips=="24510", ]
baltimoreVehicle <- baltimoreVehicle[baltimoreVehicle$type=="ON-ROAD", ]
baltimoreVehicle$City<- "Baltimore City"

#LA County --> (fips == "06037")
LAVehicle <- NEI[NEI$fips=="06037", ]
LAVehicle <- LAVehicle[LAVehicle$type=="ON-ROAD", ]
LAVehicle$City <- "Los Angeles County"

#Combine datasets
bothVehicle <- rbind(baltimoreVehicle, LAVehicle)


#Plot "plot6.png"
png("plot6.png", width = 400, height = 400)

p6 <- ggplot(bothVehicle, aes(factor(year), Emissions)) +
  geom_bar(stat = "identity", width = 0.4, aes(fill = year)) + ylim(0,5000) +
  facet_grid(scales="free", space="free", .~City) +
  xlab("Year") +
  ylab("Emissions of PM2.5 (tons)") + 
  ggtitle("Baltimore City vs LA County Vehicle-related PM2.5 Emissions from 1999 - 2008") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))

plot(p6)

#Closing the png file device - back to default
dev.off()

#FIN
