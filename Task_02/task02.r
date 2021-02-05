setwd('C:\\Desktop\\Evolution\\Tasks\\Task_02')
Data <- read.csv('http://jonsmitchell.com/data/beren.csv', stringsAsFactors=F)
write.csv(Data, 'rawdata.csv', quote=F)
Data
length(Data)
nrow(Data)
ncol(Data)
colnames(Data)
head(Data)
Data[1,]
Data[2,]
Data[1:3,]
Data[1:3, 4]
Data[1:5, 1:3]
Feeds <- which(Data[,9] == 'bottle')
berenMilk <- Data[Feeds,]
head(berenMilk)
Feeds <- which(Data[,'event'] == 'bottle')
Feeds <- which(Data$event == 'bottle')
dayID <- apply(Data, 1, function(x) paste(x[1:3], collapse='-'))
dateID <- sapply(dayID, as.Date, format = "%Y-%m-%d", origin ="2019-04-18")
Data$age <- dateID - dateID[which(Data$event == 'birth')]
head(Data)
beren2 <- Data
beren3 <- beren2[order(beren2$age),]
write.csv(beren3, 'beren_new.csv', quote=F, row.names=FALSE)
beren3
Question 1: The first two hypotheses do not have enough information regarding
nap time and weight to be truly tested. Since hypothesis 3 has sufficient
information, this hypothesis may be tested.
The units for avg milk are in ounces (oz)
The "value" column from the beren3 object was used to show values correlation 
with the "bottle" data. This was also used earlier to make the "Feeds" object.size
The set of square brackets with "Feeds" inside it show the elements in the "Feeds"
vector ; its used to determine the mean value of the entire objects in the "Feeds"
object.
Feeds <- which(beren3$event == "bottle")
avgMilk <- mean(beren3$value[Feeds])
avgMilk
avgFeed <- tapply(beren3$value[Feeds], beren3$age[Feeds], mean)
avgFeed
varFeed <- tapply(beren3$value[Feeds], beren3$age[Feeds], var)
totalFeed <- tapply(beren3$value[Feeds], beren3$age[Feeds], sum)
numFeeds <- tapply (beren3$value[Feeds] , beren3$age[Feeds], length)
cor(beren3$value[Feeds], beren3$age[Feeds])
cor.test(beren3$value[Feeds], beren3$age[Feeds])
berenCor <- cor.test(beren3$value[Feeds], beren3$age[Feeds])
summary(berenCor)
berenAnova <- aov(beren3$value[Feeds] ~ beren3$caregiver[Feeds])
boxplot( beren3$value[Feeds] ~ beren3$caregiver[Feeds], xlab= "who gave the bottle", ylab = "amount of milk consumed (oz)")
las = edited axis labels
mar=margins which should be used
mgp=the margins that should be used for the title and axis labels
tck=edited the length of tick marks
par(las=1, mar=c(5,5,1,1), mgp=c(2, 0.5, 0), tck=-0.01)
plot(as.numeric(names(totalFeed)), totalFeed, type="b", pch=16, xlab="age in days", ylab="ounces of milk")
abline(h=mean(totalFeed), lty=2, col='red')
pdf("r02b-totalMilkByDay.pdf", height = 4, width = 4)
par(las=1, mar=c(5,5,1,1), mgp=c(2, 0.5, 0), tck=-0.01)
plot(as.numeric(names(totalFeed)), totalFeed, type="b", pch=16, xlab="age in days", ylab="ounces of milk")
abline(h=mean(totalFeed), lty=2, col='red')
dev.off()
Question 2: I think the graph is impossible to interpret mainly because the intervals 
are almost smushed close together along the x-axis, making the data hard to 
decipher and read. 
source("http://jonsmitchell.com/code/plotFxn02b.R")
unique(beren3$event)
Extra Credit I:
beren4 <- beren3[Naps,]
startHour <- (beren4$start_hour)
startMin <- (beren4$start_minute)
stopHour <- (beren4$end_hour)
StopMin <- (beren4$end_minute)
startHour
startMin
stopHour
beren4$sleepTime <- ((stopHour - startHour)*60)+(stopMin - startMin)
totalNap <- tapply(beren4$sleepTime, beren4$age, sum)
totalNap
par(Las=1,mar=c,(5,5,1,1),mgp=c(2,0.5,0),tck=0.01)
plot(as.numeric(names(totalNap)), totalNap, type="b", pch=16, xlab="age in days", ylab="Nap time in minutes"
cor.test(beren4$start_hour, beren4$sleepTime)     
This correlation test between the time nap starts its total duration shows a negative relationship
between the two. 

