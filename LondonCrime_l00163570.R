# Reading the CSV
london_crime <- read.csv("london-crime-data.csv", na = "")
str(london_crime)
#Paste Date and converting string to date
?paste()
Date <- paste(1,london_crime$month, london_crime$year, sep="/")
str(Date)
london_crime <- data.frame(london_crime, Date)
str(london_crime)

london_crime$Date <- as.Date(london_crime$Date, "%d/%m/%Y")
str(london_crime)

#Subset of columns
colnames(london_crime)

names(london_crime)[2] <- "Borough"
names(london_crime)[3] <- "MajorCategory"
names(london_crime)[4] <- "SubCategory"
names(london_crime)[5] <- "Value"
names(london_crime)[8] <- "CrimeDate"

colnames(london_crime)

new_london_crime <- subset(london_crime,select=c(2,3,4,5,8))
colnames(new_london_crime)


#plot(london_crime)
summary(new_london_crime)

plot(new_london_crime$Borough)
new_london_crime$Borough <- factor(new_london_crime$Borough)
str(new_london_crime)
plot(new_london_crime$Borough)
summary(new_london_crime$Borough)


# Pie Chart

plot(new_london_crime$MajorCategory)
new_london_crime$MajorCategory <- factor(new_london_crime$MajorCategory)
summary(new_london_crime$MajorCategory)

slices <- c(9000, 18000, 10000, 2000, 7000,8000,1000,33000,27000)
lbls <- c("Burglary", "Criminal Damage", "Drugs", "Fraud or Forgery", "Other Notifiable Offences", "Robbery", "Sexual Offences", "Theft and Handling", "Violence Against the Person")
pie(slices, labels = lbls,
    main = "Simple Pie Chart")

#Region

help()

write.csv(new_london_crime,file = "London-crime-modified.csv")

new_london_crime <- data.frame(new_london_crime, Region)

for ( boroughName in new_london_crime$Borough ){
  if (boroughName == "Barking and Dagenham" || "Bexley" || "Greenwich" || "Havering" || "Kingston upon Thames " || "Newham" || "Redbridge" || "Wandsworth")
  {
    new_london_crime$Region = "East"
  }
  else if(boroughName == "Brent" || "Ealing" || "Hammersmith and Fulham " || "Harrow" || "Hillingdon" || "Hounslow" || "Richmond upon Thames")  
  {
    new_london_crime$Region = "West"
  }
  else if(boroughName == "Barnet" || "Camden" || "Enfield " || "Hackney" || "Haringey" )  
  {
    new_london_crime$Region = "North"
  }
  else if(boroughName == "Bromley" || "Croydon" || "Merton " || "Sutton" )  
  {
    new_london_crime$Region = "West"
  }
  else if(boroughName == "Islington" || "Kensington and Chelsea " || "Lambeth" || "Lewisham" || "Southwark" || "Tower Hamlets" || "Waltham Forest" || "Westminster")  
  {
    new_london_crime$Region = "Central"
  }
}

#write CSV

write.csv(new_london_crime,file = "London-crime-modified.csv")


