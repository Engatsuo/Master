library(rhdf5)

h5createFile("Test_Sample.h5")

h5createGroup("Test_Sample.h5", "Test_Sample")

h5ls("Test_Sample.h5")

a <- rnorm(n=40, m=1, sd=1) 
someData <- matrix(a,nrow=20,ncol=2)

h5write(someData, file = "Test_Sample.h5", name="Test_Sample/Test")
h5dump("test_h5.h5")