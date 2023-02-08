library(ggplot2)
library(vroom)
library(ggpubr)

wd.cur <- tryCatch(expr = dirname(rstudioapi::getSourceEditorContext()$path),
                   error=function(e){
                     return(getwd())
                   }
)

source(paste0(wd.cur,'/analysis_function.R'))

wd.data <- paste0(wd.cur,'/data')
wd.output <- paste0(wd.cur,'/Rezultati/')

#Fixed Rows
hdf5_rows <- vroom(paste0(wd.data,'/hdf5_fixed_rows.csv'), delim = ',')
xml_rows <- vroom(paste0(wd.data,'/xml_fixed_rows.csv'), delim = ',')
json_rows <- vroom(paste0(wd.data,'/json_fixed_rows.csv'), delim = ',')
parquet_rows <- vroom(paste0(wd.data,'/parquet_fixed_rows.csv'), delim = ',')

#Transforming to MB instead of GB
hdf5_rows <- hdf5_rows*1024
colnames(hdf5_rows) <- 'Filesize'
hdf5_rows$Column <- 1:50

xml_rows <- xml_rows*1024
colnames(xml_rows) <- 'Filesize'
xml_rows$Column <- 1:50

json_rows <- json_rows*1024
colnames(json_rows) <- 'Filesize'
json_rows$Column <- 1:50

parquet_rows <- parquet_rows*1024
colnames(parquet_rows) <- 'Filesize'
parquet_rows$Column <- 1:50


data <- hdf5_rows
title <- 'The change of the filesize based on the number of columns for HDF5 file format'
subtitle <- 'Row number fixed on 125000'
x_title <- 'Filesize [MB]'
y_title <- 'Number of Columns'
output_folder <- wd.output
file_name <- 'HDF5_fixed_rows.png'

graph_one_input(data = data, title = title, subtitle = subtitle, x_title = x_title, 
                  y_title = y_title, output_folder = output_folder, file_name = file_name)


data <- xml_rows
title <- 'The change of the filesize based on the number of columns for XML file format'
file_name <- 'xml_fixed_rows.png'

graph_one_input(data = data, title = title, subtitle = subtitle, x_title = x_title, 
                y_title = y_title, output_folder = output_folder, file_name = file_name)

data <- json_rows
title <- 'The change of the filesize based on the number of columns for JSON file format'
file_name <- 'json_fixed_rows.png'

graph_one_input(data = data, title = title, subtitle = subtitle, x_title = x_title, 
                y_title = y_title, output_folder = output_folder, file_name = file_name)

data <- parquet_rows
title <- 'The change of the filesize based on the number of columns for PARQUET file format'
file_name <- 'parquet_fixed_rows.png'

graph_one_input(data = data, title = title, subtitle = subtitle, x_title = x_title, 
                y_title = y_title, output_folder = output_folder, file_name = file_name)




#Fixed columns
hdf5_column <- vroom(paste0(wd.data,'/hdf5_fixed_column.csv'), delim = ',')
xml_column <- vroom(paste0(wd.data,'/xml_fixed_column.csv'), delim = ',')
json_column <- vroom(paste0(wd.data,'/json_fixed_column.csv'), delim = ',')
parquet_column <- vroom(paste0(wd.data,'/parquet_fixed_column.csv'), delim = ',')

#Transforming to MB instead of GB
hdf5_column <- hdf5_column*1024
colnames(hdf5_column) <- 'Filesize'
hdf5_column$Column <- seq(from = 5000, to = 250000, by = 5000)

xml_column <- xml_column*1024
colnames(xml_column) <- 'Filesize'
xml_column$Column <- seq(from = 5000, to = 250000, by = 5000)

json_column <- json_column*1024
colnames(json_column) <- 'Filesize'
json_column$Column <- seq(from = 5000, to = 250000, by = 5000)

parquet_column <- parquet_column*1024
colnames(parquet_column) <- 'Filesize'
parquet_column$Column <- seq(from = 5000, to = 250000, by = 5000)


data <- hdf5_column
title <- 'The change of the filesize based on the number of rows for HDF5 file format'
subtitle <- 'Column number fixed on 25'
x_title <- 'Filesize [MB]'
y_title <- 'Number of Rows'
output_folder <- wd.output
file_name <- 'HDF5_fixed_column.png'

graph_one_input(data = data, title = title, subtitle = subtitle, x_title = x_title, 
                y_title = y_title, output_folder = output_folder, file_name = file_name)


data <- xml_column
title <- 'The change of the filesize based on the number of rows for XML file format'
file_name <- 'xml_fixed_column.png'

graph_one_input(data = data, title = title, subtitle = subtitle, x_title = x_title, 
                y_title = y_title, output_folder = output_folder, file_name = file_name)

data <- json_column
title <- 'The change of the filesize based on the number of rows for JSON file format'
file_name <- 'json_fixed_column.png'

graph_one_input(data = data, title = title, subtitle = subtitle, x_title = x_title, 
                y_title = y_title, output_folder = output_folder, file_name = file_name)

data <- parquet_column
title <- 'The change of the filesize based on the number of rows for PARQUET file format'
file_name <- 'parquet_fixed_column.png'

graph_one_input(data = data, title = title, subtitle = subtitle, x_title = x_title, 
                y_title = y_title, output_folder = output_folder, file_name = file_name)




#Both change
hdf5_both <- vroom(paste0(wd.data,'/hdf5_both_change.csv'), delim = ',')
xml_both <- vroom(paste0(wd.data,'/xml_both_change.csv'), delim = ',')
json_both <- vroom(paste0(wd.data,'/json_both_change.csv'), delim = ',')
parquet_both <- vroom(paste0(wd.data,'/parquet_both_change.csv'), delim = ',')

#Transforming to MB instead of GB
hdf5_both <- hdf5_both*1024
colnames(hdf5_both) <- 'Filesize'
hdf5_both$Column <- 1:50

xml_both <- xml_both*1024
colnames(xml_both) <- 'Filesize'
xml_both$Column <- 1:50

json_both <- json_both*1024
colnames(json_both) <- 'Filesize'
json_both$Column <- 1:50

parquet_both <- parquet_both*1024
colnames(parquet_both) <- 'Filesize'
parquet_both$Column <- 1:50


data <- hdf5_both
title <- 'The change of the filesize based on the number of columns and rows for HDF5 file format'
subtitle <- 'Both change'
x_title <- 'Filesize [MB]'
y_title <- 'Number of Columns/rows'
output_folder <- wd.output
file_name <- 'HDF5_both_changing.png'

graph_one_input(data = data, title = title, subtitle = subtitle, x_title = x_title, 
                y_title = y_title, output_folder = output_folder, file_name = file_name)


data <- xml_both
title <- 'The change of the filesize based on the number of columns and rows for XML file format'
file_name <- 'xml_both_changing.png'

graph_one_input(data = data, title = title, subtitle = subtitle, x_title = x_title, 
                y_title = y_title, output_folder = output_folder, file_name = file_name)

data <- json_both
title <- 'The change of the filesize based on the number of columns and rows for JSON file format'
file_name <- 'json_both_changing.png'

graph_one_input(data = data, title = title, subtitle = subtitle, x_title = x_title, 
                y_title = y_title, output_folder = output_folder, file_name = file_name)

data <- parquet_both
title <- 'The change of the filesize based on the number of columns and rows for PARQUET file format'
file_name <- 'parquet_both_changing.png'

graph_one_input(data = data, title = title, subtitle = subtitle, x_title = x_title, 
                y_title = y_title, output_folder = output_folder, file_name = file_name)


#--------------------------------------------------------------------------------------#

#4 graphs into 1 
hdf5_rows <- vroom(paste0(wd.data,'/hdf5_fixed_rows.csv'), delim = ',')
xml_rows <- vroom(paste0(wd.data,'/xml_fixed_rows.csv'), delim = ',')
json_rows <- vroom(paste0(wd.data,'/json_fixed_rows.csv'), delim = ',')
parquet_rows <- vroom(paste0(wd.data,'/parquet_fixed_rows.csv'), delim = ',')


#Transforming to MB instead of GB
hdf5_rows <- hdf5_rows*1024
colnames(hdf5_rows) <- 'Filesize'
hdf5_rows$Column <- 1:50

xml_rows <- xml_rows*1024
colnames(xml_rows) <- 'Filesize'
xml_rows$Column <- 1:50

json_rows <- json_rows*1024
colnames(json_rows) <- 'Filesize'
json_rows$Column <- 1:50

parquet_rows <- parquet_rows*1024
colnames(parquet_rows) <- 'Filesize'
parquet_rows$Column <- 1:50

#Defining the parameters for the function
data1 <- hdf5_rows
title1 <- 'The change of the filesize based on the number of columns for HDF5 file format'
subtitle1 <- 'Row number fixed on 125000'
data2 <- xml_rows
title2 <- 'The change of the filesize based on the number of columns for XML file format'
subtitle2 <- 'Row number fixed on 125000'
data3 <- json_rows
title3 <- 'The change of the filesize based on the number of columns for JSON file format'
subtitle3 <- 'Row number fixed on 125000'
data4 <- parquet_rows
title4 <- 'The change of the filesize based on the number of columns for PARQUET file format'
subtitle4 <- 'Row number fixed on 125000'
output_folder <- wd.output
file_name <- 'All_fixed_rows.png'
x_title1 <- 'Filesize [MB]'
y_title1 <- 'Number of Columns'
x_title2 <- 'Filesize [MB]'
y_title2 <- 'Number of Columns'
x_title3 <- 'Filesize [MB]'
y_title3 <- 'Number of Columns'
x_title4 <- 'Filesize [MB]'
y_title4 <- 'Number of Columns'



graph_four_input(data1 = data1,data2 = data2 ,data3 =data3,data4=data4,
                 title1 = title1, title2 = title2, title3 = title3, title4 = title4, 
                 subtitle1 = subtitle1 , subtitle2 = subtitle2, subtitle3 = subtitle3, subtitle4 = subtitle4,
                 x_title1 = x_title1, y_title1 = y_title1, x_title2 = x_title2, y_title2 = y_title2, 
                 x_title3 = x_title3, y_title3 = y_title3, x_title4 = x_title4, y_title4 = y_title4, 
                 file_name = file_name, output_folder = output_folder, dpi = 128)



#Fixed columns in one
#Fixed columns
hdf5_column <- vroom(paste0(wd.data,'/hdf5_fixed_column.csv'), delim = ',')
xml_column <- vroom(paste0(wd.data,'/xml_fixed_column.csv'), delim = ',')
json_column <- vroom(paste0(wd.data,'/json_fixed_column.csv'), delim = ',')
parquet_column <- vroom(paste0(wd.data,'/parquet_fixed_column.csv'), delim = ',')

#Transforming to MB instead of GB
hdf5_column <- hdf5_column*1024
colnames(hdf5_column) <- 'Filesize'
hdf5_column$Column <- seq(from = 5000, to = 250000, by = 5000)

xml_column <- xml_column*1024
colnames(xml_column) <- 'Filesize'
xml_column$Column <- seq(from = 5000, to = 250000, by = 5000)

json_column <- json_column*1024
colnames(json_column) <- 'Filesize'
json_column$Column <- seq(from = 5000, to = 250000, by = 5000)

parquet_column <- parquet_column*1024
colnames(parquet_column) <- 'Filesize'
parquet_column$Column <- seq(from = 5000, to = 250000, by = 5000)

data1 <- hdf5_column
title1 <- 'The change of the filesize based on the number of rows for HDF5 file format'
subtitle1 <- 'Column number fixed on 25'
data2 <- xml_column
title2 <- 'The change of the filesize based on the number of rows for XML file format'
subtitle2 <- 'Column number fixed on 25'
data3 <- json_column
title3 <- 'The change of the filesize based on the number of rows for JSON file format'
subtitle3 <- 'Column number fixed on 25'
data4 <- parquet_column
title4 <- 'The change of the filesize based on the number of rows for PARQUET file format'
subtitle4 <- 'Column number fixed on 25'
output_folder <- wd.output
file_name <- 'All_fixed_columns.png'
x_title1 <- 'Filesize [MB]'
y_title1 <- 'Number of Rows'
x_title2 <- 'Filesize [MB]'
y_title2 <- 'Number of Rows'
x_title3 <- 'Filesize [MB]'
y_title3 <- 'Number of Rows'
x_title4 <- 'Filesize [MB]'
y_title4 <- 'Number of Rows'

graph_four_input(data1 = data1,data2 = data2 ,data3 =data3,data4=data4,
                 title1 = title1, title2 = title2, title3 = title3, title4 = title4, 
                 subtitle1 = subtitle1 , subtitle2 = subtitle2, subtitle3 = subtitle3, subtitle4 = subtitle4,
                 x_title1 = x_title1, y_title1 = y_title1, x_title2 = x_title2, y_title2 = y_title2, 
                 x_title3 = x_title3, y_title3 = y_title3, x_title4 = x_title4, y_title4 = y_title4, 
                 file_name = file_name, output_folder = output_folder, dpi = 128)



#Both change
hdf5_both <- vroom(paste0(wd.data,'/hdf5_both_change.csv'), delim = ',')
xml_both <- vroom(paste0(wd.data,'/xml_both_change.csv'), delim = ',')
json_both <- vroom(paste0(wd.data,'/json_both_change.csv'), delim = ',')
parquet_both <- vroom(paste0(wd.data,'/parquet_both_change.csv'), delim = ',')

#Transforming to MB instead of GB
hdf5_both <- hdf5_both*1024
colnames(hdf5_both) <- 'Filesize'
hdf5_both$Column <- 1:50

xml_both <- xml_both*1024
colnames(xml_both) <- 'Filesize'
xml_both$Column <- 1:50

json_both <- json_both*1024
colnames(json_both) <- 'Filesize'
json_both$Column <- 1:50

parquet_both <- parquet_both*1024
colnames(parquet_both) <- 'Filesize'
parquet_both$Column <- 1:50

#Defining the parameters for the function
data1 <- hdf5_both 
title1 <- 'The change of the filesize based on the number of columns and rows for HDF5 file format'
subtitle1 <- 'Both change'
data2 <- xml_both 
title2 <- 'The change of the filesize based on the number of columns and rows for XML file format'
subtitle2 <- 'Both change'
data3 <- json_both
title3 <- 'The change of the filesize based on the number of columns and rows for JSON file format'
subtitle3 <- 'Both change'
data4 <- parquet_both
title4 <- 'The change of the filesize based on the number of columns and rows for PARQUET file format'
subtitle4 <- 'Both change'
output_folder <- wd.output
file_name <- 'All_fixed_both_change.png'
x_title1 <- 'Filesize [MB]'
y_title1 <- 'Number of Columns'
x_title2 <- 'Filesize [MB]'
y_title2 <- 'Number of Columns'
x_title3 <- 'Filesize [MB]'
y_title3 <- 'Number of Columns'
x_title4 <- 'Filesize [MB]'
y_title4 <- 'Number of Columns'

graph_four_input(data1 = data1,data2 = data2 ,data3 =data3,data4=data4,
                 title1 = title1, title2 = title2, title3 = title3, title4 = title4, 
                 subtitle1 = subtitle1 , subtitle2 = subtitle2, subtitle3 = subtitle3, subtitle4 = subtitle4,
                 x_title1 = x_title1, y_title1 = y_title1, x_title2 = x_title2, y_title2 = y_title2, 
                 x_title3 = x_title3, y_title3 = y_title3, x_title4 = x_title4, y_title4 = y_title4, 
                 file_name = file_name, output_folder = output_folder, dpi = 120)



#-------------------------------------------------------------------------------------------#
#Three inputs
#hdf5
hdf5_rows <- vroom(paste0(wd.data,'/hdf5_fixed_rows.csv'), delim = ',')
hdf5_column <- vroom(paste0(wd.data,'/hdf5_fixed_rows.csv'), delim = ',')
hdf5_both <- vroom(paste0(wd.data,'/hdf5_both_change.csv'), delim = ',')

#Transforming to MB instead of GB
hdf5_rows <- hdf5_rows*1024
colnames(hdf5_rows) <- 'Filesize'
hdf5_rows$Column <- 1:50
#Transforming to MB instead of GB
hdf5_column <- hdf5_column*1024
colnames(hdf5_column) <- 'Filesize'
hdf5_column$Column <- seq(from = 5000, to = 250000, by = 5000)
#Transforming to MB instead of GB
hdf5_both <- hdf5_both*1024
colnames(hdf5_both) <- 'Filesize'
hdf5_both$Column <- 1:50

data1 <- hdf5_rows 
title1 <- 'The change of the filesize based on the number of columns for HDF5 file format'
subtitle1 <- 'Row number fixed on 125000'
data2 <- hdf5_column 
title2 <- 'The change of the filesize based on the number of rows for HDF5 file format'
subtitle2 <- 'Column number fixed on 25'
data3 <- hdf5_both
title3 <- 'The change of the filesize based on the number of columns and rows for HDF5 file format'
subtitle3 <- 'Both change'
output_folder <- wd.output
file_name <- 'Three_Graphs_HDF5.png'
x_title1 <- 'Filesize [MB]'
y_title1 <- 'Number of Columns'
x_title2 <- 'Filesize [MB]'
y_title2 <- 'Number of Rows'
x_title3 <- 'Filesize [MB]'
y_title3 <- 'Number of Columns'


graph_three_input(data1 = data1, data2 = data2 ,data3 =data3,
                 title1 = title1, title2 = title2, title3 = title3, 
                 subtitle1 = subtitle1 , subtitle2 = subtitle2, subtitle3 = subtitle3,
                 x_title1 = x_title1, y_title1 = y_title1, x_title2 = x_title2, y_title2 = y_title2, 
                 x_title3 = x_title3, y_title3 = y_title3,
                 file_name = file_name, output_folder = output_folder, dpi = 128)



#Three inputs
#xml
xml_rows <- vroom(paste0(wd.data,'/xml_fixed_rows.csv'), delim = ',')
xml_column <- vroom(paste0(wd.data,'/xml_fixed_rows.csv'), delim = ',')
xml_both <- vroom(paste0(wd.data,'/xml_both_change.csv'), delim = ',')

#Transforming to MB instead of GB
xml_rows <- xml_rows*1024
colnames(xml_rows) <- 'Filesize'
xml_rows$Column <- 1:50
#Transforming to MB instead of GB
xml_column <- xml_column*1024
colnames(xml_column) <- 'Filesize'
xml_column$Column <- seq(from = 5000, to = 250000, by = 5000)
#Transforming to MB instead of GB
xml_both <- xml_both*1024
colnames(xml_both) <- 'Filesize'
xml_both$Column <- 1:50

data1 <- xml_rows 
title1 <- 'The change of the filesize based on the number of columns for XML file format'
subtitle1 <- 'Row number fixed on 125000'
data2 <- xml_column 
title2 <- 'The change of the filesize based on the number of rows for XML file format'
subtitle2 <- 'Column number fixed on 25'
data3 <- xml_both
title3 <- 'The change of the filesize based on the number of columns and rows for XML file format'
subtitle3 <- 'Both change'
output_folder <- wd.output
file_name <- 'Three_Graphs_XML.png'
x_title1 <- 'Filesize [MB]'
y_title1 <- 'Number of Columns'
x_title2 <- 'Filesize [MB]'
y_title2 <- 'Number of Rows'
x_title3 <- 'Filesize [MB]'
y_title3 <- 'Number of Columns'


graph_three_input(data1 = data1, data2 = data2 ,data3 =data3,
                  title1 = title1, title2 = title2, title3 = title3, 
                  subtitle1 = subtitle1 , subtitle2 = subtitle2, subtitle3 = subtitle3,
                  x_title1 = x_title1, y_title1 = y_title1, x_title2 = x_title2, y_title2 = y_title2, 
                  x_title3 = x_title3, y_title3 = y_title3,
                  file_name = file_name, output_folder = output_folder, dpi = 128)


#Three inputs
#json
json_rows <- vroom(paste0(wd.data,'/json_fixed_rows.csv'), delim = ',')
json_column <- vroom(paste0(wd.data,'/json_fixed_rows.csv'), delim = ',')
json_both <- vroom(paste0(wd.data,'/json_both_change.csv'), delim = ',')

#Transforming to MB instead of GB
json_rows <- json_rows*1024
colnames(json_rows) <- 'Filesize'
json_rows$Column <- 1:50
#Transforming to MB instead of GB
json_column <- json_column*1024
colnames(json_column) <- 'Filesize'
json_column$Column <- seq(from = 5000, to = 250000, by = 5000)
#Transforming to MB instead of GB
json_both <- json_both*1024
colnames(json_both) <- 'Filesize'
json_both$Column <- 1:50

data1 <- json_rows 
title1 <- 'The change of the filesize based on the number of columns for JSON file format'
subtitle1 <- 'Row number fixed on 125000'
data2 <- json_column 
title2 <- 'The change of the filesize based on the number of rows for JSON file format'
subtitle2 <- 'Column number fixed on 25'
data3 <- json_both
title3 <- 'The change of the filesize based on the number of columns and rows for JSON file format'
subtitle3 <- 'Both change'
output_folder <- wd.output
file_name <- 'Three_Graphs_json.png'
x_title1 <- 'Filesize [MB]'
y_title1 <- 'Number of Columns'
x_title2 <- 'Filesize [MB]'
y_title2 <- 'Number of Rows'
x_title3 <- 'Filesize [MB]'
y_title3 <- 'Number of Columns'


graph_three_input(data1 = data1, data2 = data2 ,data3 =data3,
                  title1 = title1, title2 = title2, title3 = title3, 
                  subtitle1 = subtitle1 , subtitle2 = subtitle2, subtitle3 = subtitle3,
                  x_title1 = x_title1, y_title1 = y_title1, x_title2 = x_title2, y_title2 = y_title2, 
                  x_title3 = x_title3, y_title3 = y_title3,
                  file_name = file_name, output_folder = output_folder, dpi = 128)





#Three inputs
#PARQUET
parquet_rows <- vroom(paste0(wd.data,'/parquet_fixed_rows.csv'), delim = ',')
parquet_column <- vroom(paste0(wd.data,'/parquet_fixed_rows.csv'), delim = ',')
parquet_both <- vroom(paste0(wd.data,'/parquet_both_change.csv'), delim = ',')

#Transforming to MB instead of GB
parquet_rows <- parquet_rows*1024
colnames(parquet_rows) <- 'Filesize'
parquet_rows$Column <- 1:50
#Transforming to MB instead of GB
parquet_column <- parquet_column*1024
colnames(parquet_column) <- 'Filesize'
parquet_column$Column <- seq(from = 5000, to = 250000, by = 5000)
#Transforming to MB instead of GB
parquet_both <- parquet_both*1024
colnames(parquet_both) <- 'Filesize'
parquet_both$Column <- 1:50

data1 <- parquet_rows 
title1 <- 'The change of the filesize based on the number of columns for PARQUET file format'
subtitle1 <- 'Row number fixed on 125000'
data2 <- parquet_column 
title2 <- 'The change of the filesize based on the number of rows for PARQUET file format'
subtitle2 <- 'Column number fixed on 25'
data3 <- parquet_both
title3 <- 'The change of the filesize based on the number of columns and rows for PARQUET file format'
subtitle3 <- 'Both change'
output_folder <- wd.output
file_name <- 'Three_Graphs_parquet.png'
x_title1 <- 'Filesize [MB]'
y_title1 <- 'Number of Columns'
x_title2 <- 'Filesize [MB]'
y_title2 <- 'Number of Rows'
x_title3 <- 'Filesize [MB]'
y_title3 <- 'Number of Columns'


graph_three_input(data1 = data1, data2 = data2 ,data3 =data3,
                  title1 = title1, title2 = title2, title3 = title3, 
                  subtitle1 = subtitle1 , subtitle2 = subtitle2, subtitle3 = subtitle3,
                  x_title1 = x_title1, y_title1 = y_title1, x_title2 = x_title2, y_title2 = y_title2, 
                  x_title3 = x_title3, y_title3 = y_title3,
                  file_name = file_name, output_folder = output_folder, dpi = 128)











