#Needs library(arrow) to be loaded

#Parquet Function
parquet_creation <- function(column,row, path, data){
  
  write_parquet(x=data , sink = path)
  
}