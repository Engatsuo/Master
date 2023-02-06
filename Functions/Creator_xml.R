#Needs library(MESS) to be loaded

#XML function
xml_creation <- function(column,row, path, data){
  
  write.xml(data, file = path, collapse = TRUE)  
  
}