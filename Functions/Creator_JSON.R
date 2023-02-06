#Needs library(jsonlite) to be loaded

#JSON function
JSON_creation <- function(column,row, path, data){
  
  write(toJSON(data), path)
  
}