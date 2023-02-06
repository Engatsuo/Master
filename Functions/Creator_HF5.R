#Needs library(rhdf5) to be loaded

#HF5 function
hdf5_creation <- function(column,row, path, group_name, data_name, data){
  
  #Generate the Data
  h5createFile(path)
  
  h5createGroup(path, group)
  
  h5write(data, file = path, name= data_name)
  
}