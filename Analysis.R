library(ggplot2)
library(vroom)

wd.cur <- tryCatch(expr = dirname(rstudioapi::getSourceEditorContext()$path),
                   error=function(e){
                     return(getwd())
                   }
)

hdf5_rows <- vroom(paste0(wd.cur,'/hdf5_fixed_rows.csv'), delim = ',')
xml_rows <- vroom(paste0(wd.cur,'/xml_fixed_rows.csv'), delim = ',')
json_rows <- vroom(paste0(wd.cur,'/json_fixed_rows.csv'), delim = ',')
parquet_rows <- vroom(paste0(wd.cur,'/parquet_fixed_rows.csv'), delim = ',')

#Transforming to MB instead of GB
hdf5_rows <- hdf5_rows*1024
colnames(hdf5_rows) <- 'Filesize'
hdf5_rows$Column <- 1:100

xml_rows <- xml_rows*1024
colnames(xml_rows) <- 'Filesize'
xml_rows$Column <- 1:100

json_rows <- json_rows*1024
colnames(json_rows) <- 'Filesize'
json_rows$Column <- 1:100

parquet_rows <- parquet_rows*1024
colnames(parquet_rows) <- 'Filesize'
parquet_rows$Column <- 1:100


ggplot(data = hdf5_rows, aes( x = Filesize, y = Column, group = 1)) + geom_line(color = 'blue') + geom_point() + 
  ggtitle("The change of the filesize based on the number of columns", subtitle = "Row number fixed on 500K") +
  theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5)) + 
  ylab('Number of Columns') + xlab('Filesize [MB]')

ggplot(data = xml_rows, aes( x = Filesize, y = Column, group = 1)) + geom_line(color = 'blue') + geom_point() + 
  ggtitle("The change of the filesize based on the number of columns", subtitle = "Row number fixed on 500K") +
  theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5)) + 
  ylab('Number of Columns') + xlab('Filesize [MB]')

ggplot(data = json_rows, aes( x = Filesize, y = Column, group = 1)) + geom_line(color = 'blue') + geom_point() + 
  ggtitle("The change of the filesize based on the number of columns", subtitle = "Row number fixed on 500K") +
  theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5)) + 
  ylab('Number of Columns') + xlab('Filesize [MB]')

ggplot(data = parquet_rows, aes( x = Filesize, y = Column, group = 1)) + geom_line(color = 'blue') + geom_point() + 
  ggtitle("The change of the filesize based on the number of columns", subtitle = "Row number fixed on 500K") +
  theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5)) + 
  ylab('Number of Columns') + xlab('Filesize [MB]')


#Columns
hdf5_column <- vroom(paste0(wd.cur,'/hdf5_fixed_column.csv'), delim = ',')
xml_column <- vroom(paste0(wd.cur,'/xml_fixed_column.csv'), delim = ',')
json_column <- vroom(paste0(wd.cur,'/json_fixed_column.csv'), delim = ',')
parquet_column <- vroom(paste0(wd.cur,'/parquet_fixed_column.csv'), delim = ',')

#Transforming to MB instead of GB
hdf5_column <- hdf5_column*1024
colnames(hdf5_column) <- 'Filesize'
hdf5_column$Column <- 1:100

xml_column <- xml_column*1024
colnames(xml_column) <- 'Filesize'
xml_column$Column <- 1:100

json_column <- json_column*1024
colnames(json_column) <- 'Filesize'
json_column$Column <- 1:100

parquet_column <- parquet_column*1024
colnames(parquet_column) <- 'Filesize'
parquet_column$Column <- 1:100


ggplot(data = hdf5_column, aes( x = Filesize, y = Column, group = 1)) + geom_line(color = 'blue') + geom_point() + 
  ggtitle("The change of the filesize based on the number of columns", subtitle = "Row number fixed on 500K") +
  theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5)) + 
  ylab('Number of Columns') + xlab('Filesize [MB]')

ggplot(data = xml_column, aes( x = Filesize, y = Column, group = 1)) + geom_line(color = 'blue') + geom_point() + 
  ggtitle("The change of the filesize based on the number of columns", subtitle = "Row number fixed on 500K") +
  theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5)) + 
  ylab('Number of Columns') + xlab('Filesize [MB]')

ggplot(data = json_column, aes( x = Filesize, y = Column, group = 1)) + geom_line(color = 'blue') + geom_point() + 
  ggtitle("The change of the filesize based on the number of columns", subtitle = "Row number fixed on 500K") +
  theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5)) + 
  ylab('Number of Columns') + xlab('Filesize [MB]')

ggplot(data = parquet_column, aes( x = Filesize, y = Column, group = 1)) + geom_line(color = 'blue') + geom_point() + 
  ggtitle("The change of the filesize based on the number of columns", subtitle = "Row number fixed on 500K") +
  theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5)) + 
  ylab('Number of Columns') + xlab('Filesize [MB]')


#Both change
hdf5_both <- vroom(paste0(wd.cur,'/hdf5_both_change.csv'), delim = ',')
xml_both <- vroom(paste0(wd.cur,'/xml_both_change.csv'), delim = ',')
json_both <- vroom(paste0(wd.cur,'/json_both_change.csv'), delim = ',')
parquet_both <- vroom(paste0(wd.cur,'/parquet_both_change.csv'), delim = ',')

#Transforming to MB instead of GB
hdf5_both <- hdf5_both*1024
colnames(hdf5_both) <- 'Filesize'
hdf5_both$Column <- 1:100

xml_both <- xml_both*1024
colnames(xml_both) <- 'Filesize'
xml_both$Column <- 1:100

json_both <- json_both*1024
colnames(json_both) <- 'Filesize'
json_both$Column <- 1:100

parquet_both <- parquet_both*1024
colnames(parquet_both) <- 'Filesize'
parquet_both$Column <- 1:100


ggplot(data = hdf5_both, aes( x = Filesize, y = Column, group = 1)) + geom_line(color = 'blue') + geom_point() + 
  ggtitle("The change of the filesize based on the number of columns", subtitle = "Row number fixed on 500K") +
  theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5)) + 
  ylab('Number of Columns') + xlab('Filesize [MB]')

ggplot(data = xml_both, aes( x = Filesize, y = Column, group = 1)) + geom_line(color = 'blue') + geom_point() + 
  ggtitle("The change of the filesize based on the number of columns", subtitle = "Row number fixed on 500K") +
  theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5)) + 
  ylab('Number of Columns') + xlab('Filesize [MB]')

ggplot(data = json_both, aes( x = Filesize, y = Column, group = 1)) + geom_line(color = 'blue') + geom_point() + 
  ggtitle("The change of the filesize based on the number of columns", subtitle = "Row number fixed on 500K") +
  theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5)) + 
  ylab('Number of Columns') + xlab('Filesize [MB]')

ggplot(data = parquet_both, aes( x = Filesize, y = Column, group = 1)) + geom_line(color = 'blue') + geom_point() + 
  ggtitle("The change of the filesize based on the number of columns", subtitle = "Row number fixed on 500K") +
  theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5)) + 
  ylab('Number of Columns') + xlab('Filesize [MB]')



