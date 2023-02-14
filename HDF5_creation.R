library(rhdf5)
library(dplyr)

wd.cur <- tryCatch(expr = dirname(rstudioapi::getSourceEditorContext()$path),
                   error=function(e){
                     return(getwd())
                   }
)
wd.functions <- paste0(wd.cur,'/Functions/')
source(paste0(wd.functions,'/HDF5_function.R'))

file_path1 <- paste0(wd.cur,'/H5_files/VNP46A3.A2022001.h19v04.001.2022076204953.h5') 
data1 <- "/HDFEOS/GRIDS/VIIRS_Grid_DNB_2d"
rows1 <- 888:1992
columns1 <- 2088:2400

file_path2 <- paste0(wd.cur,'/H5_files/VNP46A3.A2022001.h20v04.001.2022076205033.h5') 
data2 <- "/HDFEOS/GRIDS/VIIRS_Grid_DNB_2d"
rows2 <- 888:1992
columns2 <- 0:744

output_file_name <- "spojeno.h5"
output_file_groupname <- "Sve"
output_file_dataname <- "Podaci"

hdf5_2file_transformer(file_path1 = file_path1, file_path2 = file_path2, data1 = data1, data2 = data2,
                       rows1 = rows1, rows2 = rows2, columns1 = columns1, columns2 = columns2,
                       output_file_name = output_file_name, output_file_groupname = output_file_groupname, output_file_dataname = output_file_dataname)

#to see the output
h5ls('spojeno.h5')

