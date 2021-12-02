library(data.table)
dt =fread("2019.csv.gz")
head(dt)

library(tidyr)
library(dplyr)
library(stringr)

predt = dt %>% pivot_wider(names_from = V3 , values_from = V4) %>%
  select(c('V1','V2','TOBS','PRCP','SNOW','SNWD')) %>%
  filter(str_detect(V1,"US"))

data = na.omit(predt)
data$totalMean=mean(data$TOBS)

head(data)
write.csv(data, "2019clean.csv", row.names=FALSE)
