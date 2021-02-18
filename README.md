# Exploratory Data Analysis Week 4 Assignment

## Required data
Available from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip, containing the files summarySCC_PM25.rds and Source_Classification_Code.rds.

## Assignment
Exploring the National Emissions Inventory database and see what it say about fine particulate matter pollution in the United states over the 10-year period 1999–2008.

## Adressing the following questions:

1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, making a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (\color{red}{\verb|fips == "24510"|}fips == "24510") from 1999 to 2008? Using the base plotting system to make a plot answering this question.
3. Of the four types of sources indicated by the \color{red}{\verb|type|}type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Using the ggplot2 plotting system to make a plot answering this question.
4. Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (\color{red}{\verb|fips == "06037"|}fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

### Making a single plot for each question and save images as plot1.png, ..., plot6.png for:

1. Total PM2.5 emissions in the United States from 1999 to 2008.
2. Total PM2.5 emissions in Baltimore City, Maryland from 1999 to 2008.
3. Total PM2.5 emissions in Baltimore City by type of sources (point, nonpoint, onroad, nonroad) from 1999 to 2008.
4. Coal combustion related PM2.5 emissions in the United States from 1999 to 2008.
5. Vehicle related PM2.5 emissions in Baltimore City from 1999 to 2008.
6. Vehicle related PM2.5 emissions in Baltimore City v LA County from 1999 to 2008.
