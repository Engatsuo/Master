#Za 19
#Latitude je Y, a Longitude je X
lat <- data.frame(Podaci$`Data Fields`$lat)
lat <- data.frame(lat[888:1992,])
colnames(lat) <- 'lat'

lon <- data.frame(Podaci$`Data Fields`$lon)
lon <- data.frame(lon[2088:2400,])
colnames(lon) <- 'lon'


#Za 19 Fajl
for (i in seq(1,length(Podaci$`Data Fields`)-2)) {
  
  Podaci$`Data Fields`[[i]] <- Podaci$`Data Fields`[[i]][888:1992,2088:2400]
  
}

Podaci$`Data Fields`$lat <- Podaci$`Data Fields`$lat[888:1992]
Podaci$`Data Fields`$lon <- Podaci$`Data Fields`$lon[2088:2400]

#Za 20 Fajl
for (i in seq(1,length(Podaci1$`Data Fields`)-2)) {
  
  Podaci1$`Data Fields`[[i]] <- Podaci1$`Data Fields`[[i]][888:1992,0:744]
  
}

Podaci1$`Data Fields`$lat <- Podaci1$`Data Fields`$lat[888:1992]
Podaci1$`Data Fields`$lon <- Podaci1$`Data Fields`$lon[0:744]


h5createFile("sve_zajedno.h5")
h5createGroup("sve_zajedno.h5", "19")
h5createGroup("sve_zajedno.h5", "20")
h5ls("sve_zajedno.h5")

h5write(Podaci$`Data Fields`, file = "sve_zajedno.h5", name="19/Podaci")
h5write(Podaci1$`Data Fields`, file = "sve_zajedno.h5", name="20/Podaci" )

k <- h5dump("sve_zajedno.h5")









