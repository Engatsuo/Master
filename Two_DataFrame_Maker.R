library(rhdf5)

#Prvi fajl
Podaci <- h5dump("D:\\Repozitorijumi\\Master\\VNP46A3.A2022001.h19v04.001.2022076204953.h5", all = TRUE)
Podaci <- h5read("D:\\Repozitorijumi\\Master\\VNP46A3.A2022001.h19v04.001.2022076204953.h5","/HDFEOS/GRIDS/VIIRS_Grid_DNB_2d",
                 read.attributes=T)

Podaci1 <-h5read("D:\\Repozitorijumi\\Master\\VNP46A3.A2022001.h20v04.001.2022076205033.h5","/HDFEOS/GRIDS/VIIRS_Grid_DNB_2d",
                             read.attributes=T)

New_Frame <- data.frame(Frame1= Podaci, Frame2 = Podaci1)

h5createFile("novasasve.h5")
h5createGroup("novasasve.h5", "Podaci")
h5write(New_Frame, file = "novasasve.h5", name="Podaci/Data")
h5ls("novasasve.h5")
colnames(New_Frame) <- gsub(".","")

#Bag je u imenima kolona, to ili iskrljaj ili smisli nesto pametno, eithern way gl.