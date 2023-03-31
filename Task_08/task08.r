setwd('~/Desktop/Evolution/Tasks/Task_08')
getwd()
library(phytools)
help(phytools)
#Question 1, 2, & 3:
trees <- list()
births <- vector()
Fractions <- vector()
random <- c()
random2 <- c()
treelist <- c()
for(i in 1:100) {
	births[i]<- runif(1)
	Fractions[i]<- runif(1)
	trees[[i]] <- pbtree(b=births[i], d=(Fractions[i]*births[i]),n=100)
	random[[i]]<-births[i]
	random2[[i]]<- (Fractions[i])
	treelist[[i]]<-mean(trees[[i]]$edge.length)
}
pdf("Trees.pdf")
plot(trees[[i]])
dev.off()
trees[[100]]$tip.label
#Question 4:
?log
sapply(trees, Ntip)
tips <- log(sapply(trees, Ntip))
random3 <- unlist(random)
head(tips)
pdf("Log tips and diversification.pdf")
plot(tips, xlab="log of tips", ylab="net diversification", pch=16)
dev.off()
?cor
cor(tips, random3)
#4: Hardly a correlation between net diversification & log of tips
#Question 5:
random4 <- unlist(random2)
treelist2 <- unlist(treelist)
plot(treelist2, random3, ylab="Speciation Rate", xlab="Average branch length", pch=4)
pdf("Average branch length and speciation rate.pdf")
plot(treelist2, random3, ylab="Speciation rate", xlab="Average branch length", pch=1)
dev.off()
?cor
cor(treelist2, random4)
#Question 5 & 6: Negative relationship - correlation = -0.0496249
#Question 7:
Tree <- trees[[which.max(tips)]]
pdf("Tree.pdf")
plot(Tree)
dev.off()
rates<-vector()
traits<-c()
meantraits<-c()
?var
vartraits<-c()
for(i in 1:100) {
	rates[i]<- runif(1)
	traits[[i]]<-fastBM(tree = Tree, sig2 = rates[i])
	meantraits[[i]]<-mean(traits[[i]])
	vartraits[[i]]<-var(traits[[i]])
}
#Question9:
meantraits<-unlist(meantraits)
pdf("meantraits and rates.pdf")
plot(meantraits, rates)
dev.off()
cor(meantraits, rates)
#Little correlation between rates and mean traits - correlation = -0.07228125
vartraits<-unlist(vartraits)
pdf("vartraits and rates.pdf")
plot(vartraits, rates)
dev.off()
cor(vartraits, rates)
#Closer relationship of variance traits & rates than mean traits and rates - correlation = 0.7655356
#Question10:
pdf("08_plot.pdf")
plot(traits[[1]], traits[[2]])
dev.off()
cor(traits[[1]], traits[[2]])
traitMat<-cbind(traits[[1]], traits[[4]])
#Negative correlation between 1st & 2nd subject traits - correlation = -0.169588
#EC
?phylomorphospace
pdf("08_ec.pdf")
phylomorphospace(Tree, traitMat, xlab= "Trait 1", ylab= "Trait 2")
dev.off()
