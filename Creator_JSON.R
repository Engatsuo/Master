library(jsonlite)

a <- rnorm(n=40, m=1, sd=1) 
someData <- matrix(a,nrow=20,ncol=2)

file <- toJSON(someData)

write(file, "json_test.json")