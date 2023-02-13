library(rhdf5)
library(dplyr)

wd.cur <- tryCatch(expr = dirname(rstudioapi::getSourceEditorContext()$path),
                   error=function(e){
                     return(getwd())
                   }
)

file_path <- paste0(wd.cur,'/H5_files/VNP46A3.A2022001.h19v04.001.2022076204953.h5') 
data1 <- h5read(file_path,"/HDFEOS/GRIDS/VIIRS_Grid_DNB_2d",
                 read.attributes=T)

file_path <- paste0(wd.cur,'/H5_files/VNP46A3.A2022001.h20v04.001.2022076205033.h5') 
data2 <- h5read(file_path,"/HDFEOS/GRIDS/VIIRS_Grid_DNB_2d",
                read.attributes=T)


#Za 19 Fajl
for (i in seq(1,length(data1$`Data Fields`)-2)) {
  
  data1$`Data Fields`[[i]] <- data1$`Data Fields`[[i]][888:1992,2088:2400]
  
}

data1$`Data Fields`$lat <- data1$`Data Fields`$lat[888:1992]
data1$`Data Fields`$lon <- data1$`Data Fields`$lon[2088:2400]

#Za 20 Fajl
for (i in seq(1,length(data2$`Data Fields`)-2)) {
  
  data2$`Data Fields`[[i]] <- data2$`Data Fields`[[i]][888:1992,0:744]
  
}

data2$`Data Fields`$lat <- data2$`Data Fields`$lat[888:1992]
data2$`Data Fields`$lon <- data2$`Data Fields`$lon[0:744]


#Lepim fajlove
for (i in seq(1,length(data1$`Data Fields`)-2)) {
  
  data1$`Data Fields`[[i]] <- cbind(data1$`Data Fields`[[i]],data2$`Data Fields`[[i]])
  
}


data1$`Data Fields`$lat <- c(data1$`Data Fields`$lat,data2$`Data Fields`$lat)
data1$`Data Fields`$lon <- c(data1$`Data Fields`$lon,data2$`Data Fields`$lon)


h5createFile("spojeni_fajlovi.h5")
h5createGroup("spojeni_fajlovi.h5", "Sve")
h5ls("spojeni_fajlovi.h5")
h5write(data1, file = "spojeni_fajlovi.h5", name="Sve/Podaci")



