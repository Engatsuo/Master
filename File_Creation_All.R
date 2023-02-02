library(rhdf5)
library(arrow)
library(MESS)
library(jsonlite)

wd.cur <- tryCatch(expr = dirname(rstudioapi::getSourceEditorContext()$path),
                   error=function(e){
                     return(getwd())
                   }
)

#Parquet Function
parquet_creation <- function(column,row, path){
  
  data <-data.frame(replicate(column,sample(x=as.double(1),size=row,rep=TRUE)))
  outputpath <- path
  write_parquet(x=data , sink = outputpath)
  
}


#JSON function
JSON_creation <- function(column,row, path){
  
  data <-toJSON(data.frame(replicate(column,sample(x=as.double(1),size=row,rep=TRUE))))
  outputpath <- path
  write(data, path)
  
}


#XML function
xml_creation <- function(column,row, path){
  
  data <-data.frame(replicate(column,sample(x=as.double(1),size=row,rep=TRUE)))
  outputpath <- path
  write.xml(data, file = path, collapse = TRUE)  
  
}


#HF5 function
hdf5_creation <- function(column,row, path, group_name, data_name){
  
  #Generate the Data
  h5createFile(path)
  h5createGroup(path, group)
  
  #Creates the Data
  data <-data.frame(replicate(column,sample(x=as.double(1),size=row,rep=TRUE)))
  outputpath <- path
  
  h5write(data, file = path, name= data_name)
  
}


#H5 Test
path <- paste0(wd.cur,"/Files/h5_test.h5")
group <- 'H5test_group'
data_name <- 'Testing Data'
h5ls(path)
hdf5_creation(column = 5, row = 100, path = path, group_name = group, data_name = data_name)

#XML Test
path <- paste0(wd.cur,"/Files/xml_test.xml")
xml_creation(column = 5, row = 100, path = path)

#JSON Test
path <- paste0(wd.cur,"/Files/json.json")
JSON_creation(column = 5, row = 100, path = path)

#Paruqet Test
path <- paste0(wd.cur,"/Files/Parquet_Test.parquet")
parquet_creation

#Fixed number of rows

for (column in vector) {
  
}




