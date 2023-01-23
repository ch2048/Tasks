setwd('/Users/ch2048/Desktop/Evolution/Tasks/Task_02')
getwd()
Data1 <- read.csv('http://jonsmitchell.com/data/beren.csv', stringsAsFactors=F)
Data2 <- read.csv('http://jonsmitchell.com/data/cyrus.csv', stringsAsFactors=F)
write.csv(Data1, 'rawdata.csv', quote=F)
length(Data1)
nrow(Data1)
ncol(Data1)
colnames(Data1)
head(Data1)
Data1[1,]
Data1[2,]
Data1[1:3, 4]
Data1[1:5, 1:3]
Feeds <- which(Data1[,9] == 'bottle')
berenMilk <- Data1[Feeds ,]
head(berenMilk)
Feeds <- which(Data1[,'event'] == 'bottle')
Feeds <- which(Data1$event == 'bottle')
dayID <- apply(Data1, 1, function(x) paste(x[1:3], collapse='-'))
dateID <- sapply(dayID, as.Date, format = "%Y-%m-%d", origin = "2019-04-18")
Data1$age <- dateID - dateID[which(Data1$event == 'birth')]
head(Data1)
beren2 <- Data1
beren3 <- beren2[order(beren2$age) ,]
write.csv(beren3, 'beren_new.csv', quote=F, row.names=FALSE)
#Question1: Hypothesis I is inappropriate because the amount Beren eats each day is not defined sufficiently to make that claim; Hypothesis II is also inappropriate because the two variables are not predicted of their relationship.  
Feeds <- which(beren3$event == "bottle")
avgMilk <- mean(beren3$value[Feeds])
avgMilk
avgFeed <- tapply(beren3$value[Feeds], beren3$age[Feeds], mean)
varFeed <- tapply(beren3$value[Feeds], beren3$age[Feeds], var)
totalFeed <- tapply(beren3$value[Feeds], beren3$age[Feeds], sum)
numFeeds <- tapply(beren3$value[Feeds] , beren3$age[Feeds], length)
cor(beren3$value[Feeds], beren3$age[Feeds])
cor.test(beren3$value[Feeds], beren3$age[Feeds])
berenCor <- cor.test(beren3$value[Feeds], beren3$age[Feeds])
summary(berenCor)
berenANOVA <- aov(beren3$value[Feeds] ~ beren3$caregiver[Feeds])
boxplot( beren3$value[Feeds] ~ beren3$caregiver[Feeds], xlab= "who gave the bottle", ylab= "amount of milk consumed (oz)" )
?par
par(las=1, mar=c(5,5,1,1), mgp=c(2, 0.5, 0), tck=-0.01)
plot(as.numeric(names(totalFeed)), totalFeed, type="b", pch=16, xlab="age in days", ylab="ounces in milk")
abline(h=mean(totalFeed), lty=2, col='red')
pdf("r02b-totalMilkByDay.pdf", height = 4, width = 4)
par(las=1, mar=c(5,5,1,1), mgp=c(2, 0.5, 0), tck=-0.01)
plot(as.numeric(names(totalFeed)), totalFeed, type="b", pch=16, xlab="age in days", ylab="ounces in milk")
abline(h=mean(totalFeed), lty=2, col='red')
dev.off()
#Question 2: The graph is impossible to interpret because the x-axis intervals display jumps that are too far between the other; its difficult to understand and read accurately. 
source("http://jonsmitchell.com/code/plotFxn02b.R")
#Hypothesis: Beren's height increases in a positive correlation over time.


