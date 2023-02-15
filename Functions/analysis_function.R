#Legend
#data - data frame containing data, must contain columns named Filesize and Column
#line_color - color of the line drawn on the graph, default black
#title_name - Name of the graph
#subtitle - Subtitle, displayed under the title
#output_folder - represents the location where the graphs will be saved
#file_name - name of the saved graph
#Graph parameters
#x_title, y_title - title of the x, y axis
#width of the saved graph - default 1920
#height of the saved graph - default 1080
#dpi of the saved graph (Dots per Inches), experiment with this if the graphs is bad looking, default is 150

#Dependency libraries
#ggplot2

graph_one_input <- function(data, line_color = 'black', title, subtitle,x_title, y_title, 
                            output_folder,file_name, dpi = 150, width = 1920, height = 1080) {
  
  ggplot(data = data, aes( x = Filesize, y = Column, group = 1)) + geom_line(color = line_color) + geom_point() + 
    ggtitle(title, subtitle) +
    theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5)) + 
    ylab(y_title) + xlab(x_title)
  
  ggsave(filename = file_name, path = output_folder,device = "png", width = width, 
                                            height = height, dpi = dpi, units = "px")
  
}

#Multiple inputs
graph_four_input <- function(data1,data2,data3,data4, line_color = 'black', 
                             title1, title2, title3, title4, 
                             subtitle1, subtitle2, subtitle3, subtitle4,
                             x_title1, y_title1, x_title2, y_title2, x_title3, y_title3, x_title4, y_title4, 
                             file_name, ncol = 2, nrow = 2,
                            output_folder, dpi = 150, width = 1920, height = 1080) {
  
  h <- ggplot(data = data1, aes( x = Filesize, y = Column, group = 1)) + geom_line(color = line_color) + geom_point() + 
    ggtitle(title1, subtitle1) +
    theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5)) + 
    ylab(y_title1) + xlab(x_title1)
  
  j <- ggplot(data = data2, aes( x = Filesize, y = Column, group = 1)) + geom_line(color = line_color) + geom_point() + 
    ggtitle(title2, subtitle2) +
    theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5)) + 
    ylab(y_title2) + xlab(x_title2)
  
  k <- ggplot(data = data3, aes( x = Filesize, y = Column, group = 1)) + geom_line(color = line_color) + geom_point() + 
    ggtitle(title3, subtitle3) +
    theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5)) + 
    ylab(y_title3) + xlab(x_title3)
  
  l <- ggplot(data = data4, aes( x = Filesize, y = Column, group = 1)) + geom_line(color = line_color) + geom_point() + 
    ggtitle(title4, subtitle4) +
    theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5)) + 
    ylab(y_title4) + xlab(x_title4)
  
  
  f <- ggarrange(h, j, k, l, 
                 ncol = ncol, nrow = nrow) 
  
  ggsave(filename = file_name, plot = f, path = output_folder,device = "png", width = width, 
         height = height, dpi = dpi, units = "px")
  
}


#Multiple inputs
graph_three_input <- function(data1,data2,data3, line_color = 'black', 
                             title1, title2, title3,  
                             subtitle1, subtitle2, subtitle3, 
                             x_title1, y_title1, x_title2, y_title2, x_title3, y_title3,
                             file_name, ncol = 2, nrow = 2,
                             output_folder, dpi = 150, width = 1920, height = 1080) {
  
  h <- ggplot(data = data1, aes( x = Filesize, y = Column, group = 1)) + geom_line(color = line_color) + geom_point() + 
    ggtitle(title1, subtitle1) +
    theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5)) + 
    ylab(y_title1) + xlab(x_title1)
  
  j <- ggplot(data = data2, aes( x = Filesize, y = Column, group = 1)) + geom_line(color = line_color) + geom_point() + 
    ggtitle(title2, subtitle2) +
    theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5)) + 
    ylab(y_title2) + xlab(x_title2)
  
  k <- ggplot(data = data3, aes( x = Filesize, y = Column, group = 1)) + geom_line(color = line_color) + geom_point() + 
    ggtitle(title3, subtitle3) +
    theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5)) + 
    ylab(y_title3) + xlab(x_title3)
  
  f <- ggarrange(h, j, k,
                 ncol = ncol, nrow = nrow) 
  
  ggsave(filename = file_name, plot = f, path = output_folder,device = "png", width = width, 
         height = height, dpi = dpi, units = "px")
  
}

#Needs 
#library(ggplot2)
#library(reshape2)


#One Input but 4 different graphs with the same value of Y
graph_one_input <- function(data, title, subtitle,x_title, y_title, 
                            output_folder,file_name, dpi = 150, width = 1920, height = 1080) {
  
  data_long <- melt(data, id = 'Column')
  
  ggplot(data_long, aes(y = value, x = Column, color = variable)) + geom_line() + geom_point() + 
    ggtitle(title, subtitle) +
    theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5)) + 
    labs(x=x_title, y=y_title)
  
  ggsave(filename = file_name, path = output_folder,device = "png", width = width, 
         height = height, dpi = dpi, units = "px")
  
}

