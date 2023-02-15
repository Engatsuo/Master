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
    
    output_path <- paste0(wd.cur,'/',file_name,'.csv')
    fwrite(x = info_frame, file = output_path)
    
  }
}















