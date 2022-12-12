library(rhdf5)
library(vroom)
library(dplyr)
library(testthat)
library(ggplot2)

#Otvaram hdf5 fajl, dumpujem ih sve, da bi mogao da ih obradjujem
Podaci <- h5dump("D:\\Repozitorijumi\\Master\\VNP46A3.A2022001.h19v04.001.2022076204953.h5", all = TRUE)

#Dobijem sliku kako izgleda unutar fajla, zatvaram i otvaram to sto mi treba
h5closeAll()
rm()

#Otvaram listu sa zapravo podacima

podaci <- h5read("D:\\Repozitorijumi\\Master\\VNP46A3.A2022001.h19v04.001.2022076204953.h5","/HDFEOS/GRIDS/VIIRS_Grid_DNB_2d",
               read.attributes=T)

#Treba mi samo podaci za lat i lon
lat <- data.frame(podaci$`Data Fields`$lat)
colnames(lat) <- 'lat'
#lat <- round(lat$lat, digits = 2)
lat <- data.frame(lat)

lon <- data.frame(podaci$`Data Fields`$lon)
#lon <- round(lon$lon, digits = 2)
colnames(lon) <- 'lon'
lon <- data.frame(lon)

#Vadim Srpsku bazu podataka!
Srbija <- vroom('D:\\Repozitorijumi\\Master\\Serbia_Map_Data.csv', delim = ',')

#Indekse i koordinate za lat i lon

srb_lat_indeksi <- c()
srb_lat <- c()
for (i in 1:nrow(Srbija)) {
  
  k <- data.frame(which(lat$lat == Srbija$lat[i]))
  j <- data.frame(lat[lat$lat == Srbija$lat[i],])
  
  srb_lat_indeksi <- rbind(srb_lat_indeksi,k)
  srb_lat <- rbind(srb_lat,j)
  
}

colnames(srb_lat_indeksi) <- 'lat_indeksi'
colnames(srb_lat) <- 'lat'

srb_lon_indeksi <- c()
srb_lon <- c()
for (i in 1:nrow(Srbija)) {
  
  k <- data.frame(which(lon$lon == Srbija$long[i]))
  j <- data.frame(lon[lon$lon == Srbija$long[i],])
  
  srb_lon_indeksi <- rbind(srb_lon_indeksi,k)
  srb_lon <- rbind(srb_lon,j)
  
}

colnames(srb_lon_indeksi) <- 'lon_indeksi'
colnames(srb_lon) <- 'lon'


###############################################
#Otvaram listu sa zapravo podacima

podaci1 <- h5read("D:\\Repozitorijumi\\Master\\VNP46A3.A2022001.h20v04.001.2022076205033.h5","/HDFEOS/GRIDS/VIIRS_Grid_DNB_2d",
                 read.attributes=T)

#Treba mi samo podaci za lat i lon
lat1 <- data.frame(podaci1$`Data Fields`$lat)
colnames(lat1) <- 'lat'
lat1 <- round(lat$lat, digits = 2)
lat1 <- data.frame(lat)

lon1 <- data.frame(podaci1$`Data Fields`$lon)
colnames(lon1) <- 'lon'
lon1 <- round(lon1$lon, digits = 2)
lon1 <- data.frame(lon)



srb_lat_indeksi1 <- c()
srb_lat1 <- c()
for (i in 1:nrow(Srbija)) {
  
  k <- data.frame(which(lat1$lat == Srbija$lat[i]))
  j <- data.frame(lat[lat1$lat == Srbija$lat[i],])
  
  srb_lat_indeksi1 <- rbind(srb_lat_indeksi1,k)
  srb_lat1 <- rbind(srb_lat1,j)
  
}

colnames(srb_lat_indeksi1) <- 'lat_indeksi'
colnames(srb_lat1) <- 'lat'

srb_lon_indeksi1 <- c()
srb_lon1 <- c()
for (i in 1:nrow(Srbija)) {
  
  k <- data.frame(which(lon1$lon == Srbija$long[i]))
  j <- data.frame(lon1[lon1$lon == Srbija$long[i],])
  
  srb_lon_indeksi <- rbind(srb_lon_indeksi1,k)
  srb_lon <- rbind(srb_lon1,j)
  
}

colnames(srb_lon_indeksi1) <- 'lon_indeksi'
colnames(srb_lon1) <- 'lon'


k <- data.frame(srb_lat$lat, srb_lon$lon)

srbija <- data.frame(lon$lon, lat$lat)
colnames(srbija) <- c('lon','lat')
map <- ggplot(srbija, aes(x= lon, y = lat)) + geom_polygon()
map1 <- ggplot(Srbija, aes(x= long, y = lat)) + geom_polygon()

ggplot(srbija, aes(lon, lat)) + 
  geom_point(size = .25, show.legend = FALSE) +
  coord_quickmap()
