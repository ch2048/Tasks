trueMean1 <- 5
trueSD1 <- 5
population1 <- rnorm(1e6, trueMean1, trueSD1)
trueMean2 <- 4
trueSD2 <- 5
population2 <- rnorm(1e6, trueMean2, trueSD2)
Size <- 50
Sample1 <- sample(population1, Size)
Sample2 <- sample(population2, Size)
# Yes, the samples are different because the samples differ by 3 objects (Sample 1=49, Sample 2=46).
boxplot(Sample1, Sample2)
source("http://jonsmitchell.com/code/simFxn04.R")
MatGrandma <- makeFounder("grandma _mom")
MatGrandpa <- makeFounder("grandpa _mom")
PatGrandma <- makeFounder("grandma _da")
PatGrandpa <- makeFounder("grandpa _da")
Alan <- makeBaby(PatGrandma, PatGrandpa)
Brenda <- makeBaby(PatGrandma, PatGrandpa)
Focus <- makeBaby(Brenda, Alan)
# The number for the ToMom object should be 0.50/ 50%.
ToMom <- length( grep("mom", Focus ) ) / length( Focus )
head(ToMom)
# These numbers shold be 0.25, 25%, 0.05. They essentially matched my expectations. 
ToMomMom <- length( grep( "grandma _mom" , Focus ) ) / length( Focus )
ToMomDad <- length( grep( " grandma _mom", Focus ) ) / length( Focus )
# While focus is equally related to each paternal grandparent, it is not equally related to each maternal grandparent.
# This isn't exactly what i expected, but relatively close. 0.2830 - average relatedness of Focus ( 4 grandparents).
Sibling_01 <- makeBaby(Brenda, Alan)
#I would expect definitely at least half or 75% of DNA to be shared with Sibling_01. The actual amount shared looks to be about 53%,
# which is lower than i initially thought, but was still in the ball park. 
ToSib <- length( intersect( Focus, Sibling_01 ) ) / length( Focus )
# The amount of genes that focus will share with each siblings is roughly the same percentage before - approx. 53%.
ManySiblings <- replicate( 1e3, length( intersect( Focus, makeBaby( Brenda, Alan) ) ) / length( Focus ) )
quantile(ManySiblings)
mean(ManySiblings)
plot(density(ManySiblings), main="", xlab="proportion shared genes")
#the reason i see a range of values in these analyses, is the DNA is not all just the same for each of the siblings. DNA
# will obviously be different with each sibling that is created.
HWE <- function(p) {}
aa <- p^2
ab <- 2 * p * (1 - p)
bb <- (1 - p)^2
return(c(aa=aa, ab=ab, bb=bb))
}
HWE(0.5)
plot(1, 1, type="n", xlim=c(0, 1), ylim=c(0, 1), xlab="freq. allele a", ylab="geno. freq")
p <- seq(from = 0, to = 1, by = 0.01)
GenoFreq <- t(sapply(p, HWE))
lines(p, GenoFreq[,"aa"], lwd=2, col="red")
# Yes i can read and understand this plot. Frequency of aa individuals will also increase as the frequency of the a allele increases in the population. 
# If the a allele frequency decreases, the aa individuals frequency follows. Time is not shown on this plot, neither geographic space. 
lines(p, GenoFreq[,"ab"], lwd=2, col="purple")
lines(p, GenoFreq[,"bb"], lwd=2, col="blue")
legend("top", legend=c("aa","ab","bb"), col=c("red","purple","blue"), lty=1, lwd=2, bty="n")
Pop <- simPop(500)
points(Pop[,"freqa"], Pop[, "Genotypes.aa"]/500, pch=21, bg="red")
#Yes, it matches the Hardy-Weinberg expectation.
Pop <- simPop(50)
points(Pop[,"freqa"], Pop[,"Genotypes.aa"]/50, pch=22, bg="red")
# The entire frequency has changed, likely due to the smaller population, the b allele is not always present. 
install.packages("learnPopGen")
library(learnPopGen)
x <- genetic.drift(Ne=200, nrep=5, pause=0.01)
PopSizes <- 5:50
Samples <- rep(PopSizes, 5)
tExt <- sapply(Samples, function(x) nrow(simPop(x, 500)))
Line <- lm(tExt ~ Samples)
summary(Line)
Line$coef
plot(Samples, tExt)
abline(Line)
#The points dispersed among each other as the population size increases; meaning more discrepancies form when the size of the population increases. 
install.packages('robustbase')

