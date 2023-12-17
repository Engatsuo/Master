start <- Sys.time()
options(digits=15)
library(rhdf5)
library(arrow)
library(MESS)
library(jsonlite)

wd.cur <- tryCatch(expr = dirname(rstudioapi::getSourceEditorContext()$path),
                   error=function(e){
                     return(getwd())
                   }
)

wd.parent <- dirname(wd.cur)
wd.functions <- paste0(wd.parent,'/Functions/')

#Loading the functions
source(paste0(wd.functions,'Creator_HF5.R'))
source(paste0(wd.functions,'Creator_JSON.R'))
source(paste0(wd.functions,'Creator_parquet.R'))
source(paste0(wd.functions,'Creator_xml.R'))



#Fixed number of rows
#Row number 125k
row <- 125000
parquet_fixed_rows <- c()
json_fixed_rows <- c()
xml_fixed_rows <- c()
hdf5_fixed_rows <- c()

for (column in seq(from = 1, to = 50, by = 1)) {
  
  data <-data.frame(replicate(column,sample(x=runif(row),size=row,rep=TRUE)))
  
  #parquet
  path <- paste0(wd.cur,"/Files/parquet_fixed_rows",column,".parquet")
  parquet_creation(column = column, row = row, path = path, data = data)
  parquet_fixed_rows <- rbind (parquet_fixed_rows, (file.info(file = path)$size)/1073741824)
  file.remove(path)
  
  #xml
  path <- paste0(wd.cur,"/Files/xml_fixed_rows",column,".xml")
  xml_creation(column = column, row = row, path = path,  data = data)
  xml_fixed_rows <- rbind (xml_fixed_rows, (file.info(file = path)$size)/1073741824)
  file.remove(path)
  
  #json
  path <- paste0(wd.cur,"/Files/json_fixed_rows",column,".json")
  JSON_creation(column = column, row = row, path = path, data = data)
  json_fixed_rows <- rbind (json_fixed_rows, (file.info(file = path)$size)/1073741824)
  file.remove(path)
  
  #hdf5
  path <- paste0(wd.cur,"/Files/hdf5_fixed_rows",column,".h5")
  group <- 'H5_data'
  data_name <- 'H5_benchmarking_data'
  hdf5_creation(column = column, row = row, path = path, group_name = group, data_name = data_name, data = data)
  hdf5_fixed_rows <- rbind (hdf5_fixed_rows, (file.info(file = path)$size)/1073741824)
  file.remove(path)
  
  print(column)
}

write.csv(x= parquet_fixed_rows, file = paste0(wd.cur,"/parquet_fixed_rows.csv"), row.names = F)
write.csv(x= xml_fixed_rows, file = paste0(wd.cur,"/xml_fixed_rows.csv"), row.names = F)
write.csv(x= json_fixed_rows, file = paste0(wd.cur,"/json_fixed_rows.csv"), row.names = F)
write.csv(x= hdf5_fixed_rows, file = paste0(wd.cur,"/hdf5_fixed_rows.csv"), row.names = F)


#------------------------------------------------------------------------------#
#Fixed Columns
column <- 25
i <- 1

parquet_fixed_column <- c()
json_fixed_column <- c()
xml_fixed_column <- c()
hdf5_fixed_column <- c()

for (row in seq(from = 5000, to = 250000, by = 5000)) {
  
  data <-data.frame(replicate(column,sample(x=runif(row),size=row,rep=TRUE)))
  
  #parquet
  path <- paste0(wd.cur,"/Files/parquet_fixed_column",i,".parquet")
  parquet_creation(column = column, row = row, path = path, data = data)
  parquet_fixed_column <- rbind (parquet_fixed_column, (file.info(file = path)$size)/1073741824)
  file.remove(path)
  
  #xml
  path <- paste0(wd.cur,"/Files/xml_fixed_column",i,".xml")
  xml_creation(column = column, row = row, path = path, data = data)
  xml_fixed_column <- rbind (xml_fixed_column, (file.info(file = path)$size)/1073741824)
  file.remove(path)
  
  #json
  path <- paste0(wd.cur,"/Files/json_fixed_column",i,".json")
  JSON_creation(column = column, row = row, path = path, data = data)
  json_fixed_column <- rbind (json_fixed_column, (file.info(file = path)$size)/1073741824)
  file.remove(path)
  
  #hdf5
  path <- paste0(wd.cur,"/Files/hdf5_fixed_column",i,".h5")
  group <- 'H5_data'
  data_name <- 'H5_benchmarking_data'
  hdf5_creation(column = column, row = row, path = path, group_name = group, data_name = data_name, data = data)
  hdf5_fixed_column <- rbind (hdf5_fixed_column, (file.info(file = path)$size)/1073741824)
  file.remove(path)
  
  print(i)
  i <- i + 1
  
}

write.csv(x= parquet_fixed_column, file = paste0(wd.cur,"/parquet_fixed_column.csv"), row.names = F)
write.csv(x= xml_fixed_column, file = paste0(wd.cur,"/xml_fixed_column.csv"), row.names = F)
write.csv(x= json_fixed_column, file = paste0(wd.cur,"/json_fixed_column.csv"), row.names = F)
write.csv(x= hdf5_fixed_column, file = paste0(wd.cur,"/hdf5_fixed_column.csv"), row.names = F)


#------------------------------------------------------------------------------#
#Both change

z <- data.frame(rows=seq(from = 5000, to = 250000, by = 5000))

parquet_both_change <- c()
json_both_change <- c()
xml_both_change <- c()
hdf5_both_change <- c()

for (column in seq(from = 1, to = 50, by = 1)) {
  
  row <- z[column,]
  data <-data.frame(replicate(column,sample(x=runif(row),size=row,rep=TRUE)))
  
  #parquet
  path <- paste0(wd.cur,"/Files/parquet_both_change",column,".parquet")
  parquet_creation(column = column, row = row, path = path, data = data)
  parquet_both_change <- rbind (parquet_both_change, (file.info(file = path)$size)/1073741824)
  file.remove(path)
  
  #xml
  path <- paste0(wd.cur,"/Files/xml_both_change",column,".xml")
  xml_creation(column = column, row = row, path = path, data = data)
  xml_both_change <- rbind (xml_both_change, (file.info(file = path)$size)/1073741824)
  file.remove(path)
  
  #json
  path <- paste0(wd.cur,"/Files/json_both_change",column,".json")
  JSON_creation(column = column, row = row, path = path, data = data)
  json_both_change <- rbind (json_both_change, (file.info(file = path)$size)/1073741824)
  file.remove(path)
  
  #hdf5
  path <- paste0(wd.cur,"/Files/hdf5_both_change",column,".h5")
  group <- 'H5_data'
  data_name <- 'H5_benchmarking_data'
  hdf5_creation(column = column, row = row, path = path, group_name = group, data_name = data_name, data = data)
  hdf5_both_change <- rbind (hdf5_both_change, (file.info(file = path)$size)/1073741824)
  file.remove(path)
  
  print(column)
}

write.csv(x= parquet_both_change, file = paste0(wd.cur,"/parquet_both_change.csv"), row.names = F)
write.csv(x= xml_both_change, file = paste0(wd.cur,"/xml_both_change.csv"), row.names = F)
write.csv(x= json_both_change, file = paste0(wd.cur,"/json_both_change.csv"), row.names = F)
write.csv(x= hdf5_both_change, file = paste0(wd.cur,"/hdf5_both_change.csv"), row.names = F)

end <- Sys.time()

execution <- end - start
execution <- data.frame(time = execution)
write.csv(execution, file = paste0(wd.cur,"/time1.csv"), row.names = F)

