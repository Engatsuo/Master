library(arrow)

a <- rnorm(n=40, m=1, sd=1) 
someData <- matrix(a,nrow=20,ncol=2)
someData <- as.data.frame(someData)

wd.cur <- tryCatch(expr = dirname(rstudioapi::getSourceEditorContext()$path),
                   error=function(e){
                     return(getwd())
                   }
)

file_path <- paste0(wd.cur,'/test_parquet.parquet')

write_parquet(x = someData, sink = file_path)