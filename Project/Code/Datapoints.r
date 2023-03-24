setwd('~/Desktop/Evolution/Tasks/Project/Data')
Data1 <- read.csv("NPHData1.csv")
head (Data1)
library(phytools)
library(ggplot2)
pdf("PouchvsLeafNo.pdf")
boxplot(Pouch~LeafNo, data=Data1)
dev.off()
cor.test(Data1$Pouch, Data1$LeafNo)












