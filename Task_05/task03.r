install.packages("learnPopGen")
library(learnPopGen)
install.packages("coala")
library("coala")
install.packages("phytools")
library("phytools")
coalescent.plot()
#There are 10 alleles per each simulation, whih can be modified using the "n =part of the coalescent.plot()" fxn.
#On average, it takes about 10 generations for an allele to finally reach fixation
#According to the system, the number appears to be 2; now the variance of that number shows its low. 
#The role that fitness plays in this simulation has to do with individuals with those certain alleles, and to have that high allele distribution, requires those parents (p generation) to mate consistently to efficiently pass down these alleles. 
#yes.
pdf("Question1.pdf", height=5, width=5)
coalescent.plot(n=20, ngen=20, colors=NULL)
dev.off()
pdf("Question2.pdf", height=5, width=5)
coalescent.plot(n=10, ngen=15, colors=NULL)
dev.off()
pdf("Question3.pdf", height=5, width=5)
coalescent.plot(n=10, ngen=5, colors=NULL)
dev.off()
install.packages("coala")
library(coala)
install.packages("phytools")
library(phytools)
model <- coal_model(sample_size = 5, loci_number = 10, loci_length = 500, ploidy = 2)+
feat_mutation(10)+
feat_recombination(10)+
sumstat_trees()+
sumstat_nucleotide_div()
stats <- simulate(model, nsim = 1)
Diversity <- stats$pi
#No, increased recombination and mutations are what caused the differences
Nloci <- length(stats$trees)
t1 <- read.tree(text=stats$trees[[1]][[1]])
plot(t1)
axisPhylo()
#They do not match because per each individual in this plot, accounts for two alleles. 
Age1 <- max(nodeHeights(t1))
t2 <- read.tree(text=stats$trees[[2]][1])
plot(t2)
axisPhylo()
#The first SNP is not as far back as this SNP when it comes to age and common ancestors.
#No, they don't match.
par(mfrow=c(1,2))
plot(t1)
axisPhylo()
plot(t2)
axisPhylo()
compare.chronograms(t1, t2)
t1_1 <- read.tree(text=stats$trees[[1]][1])
t1_2 <- read.tree(text=stats$trees[[1]][2])
compare.chronograms(t1_1, t1_2)
for (locus in 1:Nloci) {
 ntrees <- length(stats$trees[[locus]])
 for (n in 1:ntrees) {
  if (locus == 1 && n == 1) {
    outPhy <- read.tree(text=stats$trees[[locus]][n])
}
   else {
     outPhy <- ape:::c.phylo(outphy, read.tree(text=stats$trees[[locus]][n]))
    }
  }
}
par(mfrow=c(1,1))
densityTree(outPhy)
#Predicting an increased recombination and mutations would cause more diversity is how i seen it panning out. 
model3 <- coal_model(10, 50)+
  feat_mutation(par_prior("theta", sample.int(100, 1)))+
  sumstat_nucleotide_div()
stats <- simulate(model3, nsim = 40)
mean_pi <- sapply(stats, function(x) mean(x$pi))
theta <- sapply(stats, function(x) x$pars[["theta"]])
#Extra Credit
