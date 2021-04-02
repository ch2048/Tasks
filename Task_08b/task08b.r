library(phytools)
tree <- read.tree('https://jonsmitchell.com/data/anolis.tre')
plot(tree, type="fan")
tree$tip.label
#Question 1: There are 82 tree tips, and branch lengths are indeed present (161).
data <- read.csv("https://jonsmitchell.com/data/svl.csv", stringsAsFactors=F, row.names=1)
#Question 2: The data object shows 100 dimensions, which includes a set of each lizard species, including their snout vent length. 
svl <- setNames(data$svl, rownames(data))
Ancestors <- fastAnc(tree, svl, vars=TRUE, CI=TRUE)
Ancestors
?fastAnc
#Question 3: Estimated values are stored in an 'ace' catalog. And, the C195 element represents a confidence interval. 
#Question 4: the state computed for the root node of the tree during Felsenstein's (1985) contrasts algorithm is also the MLE of the root node. The function will re-root the tree at all internal nodes and computes the contrasts state at the root each time, assuming variance as the contrast state. 
par(mar=c(0.1,0.1,0.1,0.1))
plot(tree, type="fan", lwd=2, show.tip.label=F)
tiplabels(pch=16, cex=0.25*svl[tree$tip.label])
nodelabels(pch=16, cex=0.25*Ancestors$ace)
obj <- contMap(tree, svl, plot=F)
plot(obj, type="fan", legend=0.7*max(nodeHeights(tree)), sig=2, fsize=c(0.7, 0.9))
fossilData <- data.frame(svl=log(c(25.4, 23.2, 17.7, 19.7, 24, 31)), tip1=c("Anolis_aliniger", "Anolis_aliniger", "Anolis_occultus", "Anolis_ricordii", "Anolis_cristatellus", "Anolis_occultus"), tip2=c("Anolis_chlorocyanus", "Anolis_coelestinus", "Anolis_hendersoni", "Anolis_cybotes", "Anolis_angusticeps", "Anolis_angusticeps"))
fossilData
#Question 5: 
fossilNodes <- c()
nodeN <- c()
{
  for(i in 1:nrow(fossilData))
    i <- 1
  if( i ==1) {
    print(Ancestors)
  }
}
Node <- fastMRCA(tree, fossilData[i, "tip1"], fossilData[i, "tip2"])
fossilNodes[i] <- fossilData[i, "svl"]
nodeN[i] <- Node
names(fossilNodes) <- nodeN
Ancestors_withFossils <- fastAnc(tree, svl, anc.states=fossilNodes, CI=TRUE, var=TRUE)
#Question 7: The way fossils will change estimated ancestral sizes is that it will cause the sizes to increase in numbers. 
#Questions 8-10: install.packages("geiger")
library("geiger")
?fitContinuous
fitContinuous(tree, svl, model="BM")
fitContinuous(tree, svl, model="OU")
fitContinuous(tree, svl, model="EB")
#The 3rd model above (EB model) fits the data the best because it has the lowest AIC. 
?fastAnc
#When it comes to this particular interest, the BM model is whats used by the Anc function to configure the assumptions;however, here EB model shows the best fit concerning the data. 