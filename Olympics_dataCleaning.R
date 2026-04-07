setwd("E:/STAT3355")

olympics_dataset <- read.csv("E:/STAT3355/Athletes_summer_games.csv")
gdp_dataset <- read.csv("E:/STAT3355/gdp_dataset.csv")
population_dataset <- read.csv("E:/STAT3355/Population_dataset.csv")


swimming_olympics <- subset(olympics_dataset, Sport == "Swimming", select = c(-Season, 
                            -City, -Games))

swimming_olympics <- swimming_olympics[swimming_olympics$Year >= 1992, ]

swimming_olympics$Age_Group <- cut( swimming_olympics$Age,
  breaks = c(0, 18, 25, 35, Inf),
  labels = c("Under 18", "18-25", "26-35", "35+")
)

swimming_olympics$Medal_Cleaned <- ifelse( is.na(swimming_olympics$Medal) | swimming_olympics$Medal == "","No Medal",
  swimming_olympics$Medal
)


swimming_olympics$Medal <- NULL

swimming_olympics$Gender <- ifelse(
  swimming_olympics$Sex == "M", "Male", "Female"
)

swimming_olympics$Sex <- NULL

country_map <- data.frame(
  NOC = c("USA","GBR","AUS","CHN","RUS","GER","FRA","ITA","JPN","CAN",
          "NED","SWE","HUN","BRA","RSA","ESP","NZL","POL","DEN","UKR",
          "GRE","ARG","FIN","NOR","BEL","AUT","MEX","CZE","SVK","KOR"),
  Country = c("United States","United Kingdom","Australia","China","Russia",
              "Germany","France","Italy","Japan","Canada",
              "Netherlands","Sweden","Hungary","Brazil","South Africa",
              "Spain","New Zealand","Poland","Denmark","Ukraine",
              "Greece","Argentina","Finland","Norway","Belgium","Austria",
              "Mexico","Czech Republic","Slovakia","South Korea")
)

swimming_olympics <- merge(swimming_olympics, country_map, by="NOC", all.x=TRUE)

# Merge GDP
swimming_olympics <- merge(
  swimming_olympics,
  gdp_dataset[, c("Entity", "Year", "GDP.per.capita")],
  by.x = c("Country", "Year"),
  by.y = c("Entity", "Year"),
  all.x = TRUE
)

#Merge Population

population_dataset <- reshape(population_dataset,
                              varying = names(population_dataset)[5:ncol(population_dataset)],
                              v.names = "Population",
                              timevar = "Year",
                              times = as.integer(sub("X", "", names(population_dataset)[5:ncol(population_dataset)])),
                              direction = "long")

swimming_olympics <- merge(
  swimming_olympics,
  population_dataset[, c("Country.Name", "Year", "Population")],
  by.x = c("Country", "Year"),
  by.y = c("Country.Name", "Year"),
  all.x = TRUE
)

# Removes athletes whose countries or GDP data were not found during the merge
swimming_olympics <- swimming_olympics[!is.na(swimming_olympics$Country) & 
                                       !is.na(swimming_olympics$GDP.per.capita), ]

#Final Inspection 
head(swimming_olympics)
summary(swimming_olympics)

