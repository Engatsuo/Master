library(rhdf5)

#Pravim fajl
h5createFile("irisdataset.h5")

#Dodajem subgrupe
h5createGroup("irisdataset.h5", "Data_Structure")

#Prosto istampa da vidim jel upisana grupa
h5ls("irisdataset.h5")

#Ubacujem podatke unutar fajla
#Znaci ovime mogu da radim sta hocu, ono upisuje kao data-frame, ako hocu da ih isflitriram pre, u jedan data-frame i to je to
#Sve u ovo ubacuje i sa jednom komandom sve uradim, nema wrangling u ovom koraku, sve unapred uradi
h5write(iris, file = "irisdataset.h5", name="Data_Structure/Podaci")

#Provera
h5ls("irisdataset.h5")

#I da ih vidim, moram da ih dump
k <- h5dump("irisdataset.h5")

#To je sto se tice bitni stvari, imas atribute da dodajes ako bas hoces da medjutim me ovde mrzi, eve link ako bude trebalo
#Takodje ovo je i source svega ovoga:

#https://www.neonscience.org/resources/learning-hub/tutorials/hdf5-intro-r

