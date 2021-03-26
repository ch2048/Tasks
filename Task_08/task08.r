library(phytools)
library(ape)
text.string<-
  "(((((((cow, pig),whale),(bat,(lemur,human))),(robin,iguana)),coelacanth),(gold_fish, trout)),shark);"
vert.tree <- read.tree(text=text.string)
plot(vert.tree, edge.width=2)
nodelabels(frame="circle", bg='white', cex=1)
#Question 1: A shark is more closely related to a gold fish, rather than human.
vert.tree
#Question 2: No. 
str(vert.tree)
tree<-read.tree(text="(((A,B),(C,D)),E);")
plotTree(tree,offset=1)
tiplabels(frame="circle", bg='lightblue', cex=1)
nodelabels(frame="circle", bg='white', cex=1)
tree$tip.label
tree$edge
AnolisTree <- force.ultrametric(read.tree("https://jonsmitchell.com/data/anolis.tre"))
par(las=1)
hist(AnolisTree$edge.length, col='black', border='white', main="", xlab="edge lengths for the Anolis tree", ylim=c(0, 50), xlim=c(0, 6))
tipEdges <- which(AnolisTree$edge[,2] <= Ntip(AnolisTree))
Lengths <- AnolisTree$edge.length
names(Lengths) <- AnolisTree$tip.label
names(Lengths)[which(Lengths == min(Lengths))]
plot(AnolisTree, cex=0.25)
Labs <- sapply(AnolisTree$edge.length, round, digits=2)
edgelabels(text=Labs, cex=0.25)
?plot.phylo
#Question 3 -Answer(s): tree <- read.tree(text="(((A,B), (C,D)), E);")
plot.phylo(tree, type="phylogram", show.tip.label=FALSE, edge.color="blue")
#Question 4 -Answer: plot.phylo(tree, type="radial")
#Question 5 -Answer(s): plot.phylo(tree, tip.color = "red")
#Question 6-8 -Answer(s):Labs <- sapply(AnolisTree$edge.length, round, digits=2)
edgelabels(text=Labs, cex=0.25)
which(Lengths == min(Lengths))
#According to this code, the "Anolis_occultus" would have the shortest edge length.
names(Lengths)
#Tip dropped: AnolisTree2 <- drop.tip(AnolisTree, "Anolis_occultus")
#Resulting tree: plot(AnolisTree2, cex=0.25)
ltt(AnolisTree)
abline(0, 1, lwd=2, col='red', lty=2)
#The line shows a dashed line running diagonally vertical. No it won't go down; because these lizards progressively become more near the maximum number.The slope will also not change because of the lizards reaching the maximum number one by one. 
#Question 10 -Answer: fit.bd(AnolisTree, rho = 0.2)


