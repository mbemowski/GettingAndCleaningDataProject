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