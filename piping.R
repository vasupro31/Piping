install.packages("dplyr")
library(dplyr)
download.file(url = "https://projects.fivethirtyeight.com/soccer-api/international/2022/wc_matches.csv", destfile = "WorldCup.csv")
WorldCup<- read.csv("WorldCup.csv")
View(WorldCup)
mysample<-sample_n(WorldCup, size=15, replace = FALSE, weight = NULL, .env = NULL)
write.csv(mysample, 'mysample.csv')
mysample2<-mysample %>%
  arrange(date) %>%
  filter(spi1<80) %>%
  rename(Index1 = spi1, Index2 = spi2) %>%
  select(Index1, Index2, team1, team2 ) %>%
  summary()%>%
  print()
