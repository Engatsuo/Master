#File write
library(data.table)
library(rhdf5)
library(tidyr)
library(magrittr)

h5_lookup <- function(file_path, output_path = NULL, file_name = NULL){
  
  lookup_data <- h5ls(file_path) 
  lookup_data  %<>%   mutate(Type = case_when(
    endsWith(otype, "DATASET") ~ "DATASET",
    endsWith(otype, "GROUP") ~ "GROUP"))
  
  info_frame <- lookup_data %>% select(group, Type)
  info_frame <- unique(info_frame) 
  info_frame   %<>%   arrange(group)
  
  print(info_frame)

  if (!is.null(output_path)&&!is.null(file_name)) {
    
    output_path_1 <- paste0(wd.cur,'/',file_name,'Short.csv')
    output_path_2 <- paste0(wd.cur,'/',file_name,'Detailed.csv')
    fwrite(x = info_frame, file = output_path_1)
    fwrite(x = lookup_data, file = output_path_2)
  }
}




#Funkcija da zalepi dva fajla zajedno
#Ova funkcija koristi se konkretno na LAADS dac problemu, zato je struktuirana oko tih podataka

hdf5_2file_transformer <- function(file_path1, data1, file_path2, data2, rows1, columns1, rows2, columns2,
                                   output_file_name, output_file_groupname, output_file_dataname) {
  
  #Učitava se prvi fajl
  data1 <- h5read(file_path1,data1,
                  read.attributes=T)
  
  #Filtriranje prvog fajla
  for (i in seq(1,length(data1$`Data Fields`)-2)) {
    
    data1$`Data Fields`[[i]] <- data1$`Data Fields`[[i]][rows1,columns1]
    
  }
  
  data1$`Data Fields`$lon <- data1$`Data Fields`$lon[rows1]
  data1$`Data Fields`$lat <- data1$`Data Fields`$lat[columns1]
  
  #Učitava se drugi fajl
  data2 <- h5read(file_path2,data2,
                  read.attributes=T)
  
  #Filtriranje drugog fajla
  for (i in seq(1,length(data2$`Data Fields`)-2)) {
    
    data2$`Data Fields`[[i]] <- data2$`Data Fields`[[i]][rows2,columns2]
    
  }
  
  data2$`Data Fields`$lon <- data2$`Data Fields`$lon[rows2]
  data2$`Data Fields`$lat <- data2$`Data Fields`$lat[columns2]
  
  
  #Lepim fajlove
  for (i in seq(1,length(data1$`Data Fields`)-2)) {
    
    data1$`Data Fields`[[i]] <- cbind(data1$`Data Fields`[[i]],data2$`Data Fields`[[i]])
    
  }
  
  
  data1$`Data Fields`$lat <- c(data1$`Data Fields`$lat,data2$`Data Fields`$lat)
  data1$`Data Fields`$lon <- c(data1$`Data Fields`$lon,data2$`Data Fields`$lon)
  
  #
  rm(data2)
  
  h5createFile(file = output_file_name)
  h5createGroup(file = output_file_name, group = output_file_groupname)
  h5write(data1, file = output_file_name, name= paste0(output_file_groupname,'/',output_file_dataname))
  
  
}










