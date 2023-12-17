list.of.packages <-
  c("jsonlite",
    "MESS",
    "arrow",
    "rhdf5",
    "ggplot2",
    "reshape2",
    "ggrepel",
    "ggpubr",
    "vroom",
    "dplyr",
    "tidyverse"
  )
new.packages <-
  list.of.packages[!(list.of.packages %in% installed.packages()[, "Package"])]
if (length(new.packages))
  install.packages(new.packages)