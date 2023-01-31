library(MESS)

a <- rnorm(n=40, m=1, sd=1) 
someData <- matrix(a,nrow=20,ncol=2)
someData <- as.data.frame(someData)

write.xml(someData, file = 'test_xml.xml', collapse = TRUE)