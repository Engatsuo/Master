library(rhdf5)
library(vroom)
library(dplyr)
library(testthat)

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
lon <- data.frame(podaci$`Data Fields`$lon)
colnames(lon) <- 'lon'

#Vadim Srpsku bazu podataka!
Srbija <- vroom('D:\\Repozitorijumi\\Master\\Serbia_Map_Data.csv', delim = ',')

#izjednacavam

srb_lat <- c()

for (i in 1:nrow(Srbija)) {
    
  k <- lat == Srbija$lat[i]
  srb_lat <- rbind(srb_lat,k)
  
}








