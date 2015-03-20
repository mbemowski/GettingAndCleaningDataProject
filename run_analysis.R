labels <- read.table("activity_labels.txt")
features <- read.table("features.txt")

testX <- read.table("test/X_test.txt")
testY <- read.table("test/y_test.txt")
testSub <- read.table("test/subject_test.txt")
trainX <- read.table("train/X_train.txt")
trainY <- read.table("train/y_train.txt")
trainSub <- read.table("train/subject_train.txt")

sub <- rbind(trainSub, testSub)
x <- rbind(trainX, testX)
y <- rbind(trainY, testY)

meanStdFeaturesCols <- grepl("std\\(\\)|mean\\(\\)", features[,2])
meanStdFeatures <- features[meanStdFeaturesCols,2]
meanStdX <- x[,meanStdFeaturesCols]

library(plyr)
yLab <- mapvalues(y[,1], labels[,1], as.character(labels[,2]))
data <- cbind(sub,yLab,meanStdX)
colnames(data) <- c("subject","activity",as.character(meanStdFeatures))
