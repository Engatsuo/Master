library(rhdf5)

wd.cur <- tryCatch(expr = dirname(rstudioapi::getSourceEditorContext()$path),
                   error=function(e){
                     return(getwd())
                   }
)

wd.functions <- paste0(wd.cur,'/Functions/')
source(paste0(wd.functions,'/HDF5_functions.R'))


file_folder <- paste0(wd.cur,'/LaadsDac_podaci')
#Ucita listu sa fajlovima iz foldera
file_list <- list.files(file_folder)
#Mesec i parametar za petlju
months <- format(ISOdate(2004,1:12,1),"%B")
j <- 1
#Prvo filtriranje svih fajlova, vadim podatke za Republiku Srbiju, smanjujem broj fajlova sa 24 na 12
for (i in 1:(length(file_list)/2)) {
  
  file_path1 <- paste0(file_folder,'/',file_list[j])
  #Ovaj deo je dobijen korišćenjem funkcije h5_lookup
  data1 <- "/HDFEOS/GRIDS/VIIRS_Grid_DNB_2d"
  rows1 <- 888:1992
  columns1 <- 2088:2400
  
  file_path2 <- paste0(file_folder,'/',file_list[j+1]) 
  data2 <- "/HDFEOS/GRIDS/VIIRS_Grid_DNB_2d"
  rows2 <- 888:1992
  columns2 <- 0:744
  
  output_file_name <- paste0(wd.cur,'/LaadsDac_rezultati/',months[i],'2022.h5')
  output_file_groupname <- paste0(months[i],'2022')
  
  hdf5_2file_transformer(file_path1 = file_path1, file_path2 = file_path2, data1 = data1, data2 = data2,
                         rows1 = rows1, rows2 = rows2, columns1 = columns1, columns2 = columns2,
                         output_file_name = output_file_name, output_file_groupname = output_file_groupname)
  
  
}


#Sada spajam 12 rezultujucih u jedan kompaktan
folder_location <- paste0(wd.cur,'/LaadsDac_rezultati')
#Ucita listu sa fajlovima iz foldera
file_list <- list.files(folder_location)
output_file_name <- paste0(wd.cur,'/LaadsDac_rezultatiSveSpojeno/2022Srbija.h5')

hdf5_file_combiner(file_list = file_list, output_file_name = output_file_name, folder_location = folder_location)







