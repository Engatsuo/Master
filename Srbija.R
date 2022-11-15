library(ggplot2)
library(dplyr)

mapdata <- map_data('world')

Srbija <- mapdata[mapdata$region == 'Serbia',]

JebemVamMater <- mapdata[mapdata$region == 'Kosovo',]

Srbija <- rbind(Srbija,JebemVamMater)

Srbija$region[Srbija$region == 'Kosovo'] <- 'Serbia' 

map1 <- ggplot(Srbija, aes(x= long, y = lat), colour = 'black') + geom_polygon()

Srbija <- data.frame(Srbija)
Srbija <- Srbija[,-c(3,4,6)]
write.csv(x = Srbija, file = 'D:\\Repozitorijumi\\Master\\Serbia_Map_Data.csv', row.names = F)
