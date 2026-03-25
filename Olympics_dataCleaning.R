setwd("E:/STAT3355")

olympics_dataset <- read.csv("E:/STAT3355/Athletes_summer_games.csv")

swimming_olympics <- subset(olympics_dataset, Sport == "Swimming", select = c(-Season, 
                            -City, -NOC, -Games))

swimming_olympics$Age_Group <- cut( swimming_olympics$Age,
  breaks = c(0, 18, 25, 35, Inf),
  labels = c("Under 18", "18-25", "26-35", "35+")
)
