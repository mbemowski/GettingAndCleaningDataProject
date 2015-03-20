# reading metadata
labels <- read.table("activity_labels.txt")
features <- read.table("features.txt")

# reading data
testX <- read.table("test/X_test.txt")
testY <- read.table("test/y_test.txt")
testSub <- read.table("test/subject_test.txt")
trainX <- read.table("train/X_train.txt")
trainY <- read.table("train/y_train.txt")
trainSub <- read.table("train/subject_train.txt")

# merging train and test set
sub <- rbind(trainSub, testSub)
x <- rbind(trainX, testX)
y <- rbind(trainY, testY)

# selecting only columns with standard deviation and mean values
meanStdFeaturesCols <- grepl("std\\(\\)|mean\\(\\)", features[,2])
meanStdFeatures <- features[meanStdFeaturesCols,2]
meanStdX <- x[,meanStdFeaturesCols]

# mapping activities codes to names and binding data into one frame
# with appriopriate columns names
library(plyr)
yLab <- mapvalues(y[,1], labels[,1], as.character(labels[,2]))
data <- cbind(sub,yLab,meanStdX)
colnames(data) <- c("subject","activity",as.character(meanStdFeatures))

# grouping data by subject and activity and calculating mean value
install.packages("dplyr")
library(dplyr)
dataGroup <- group_by(data, subject, activity)
tidy <- summarise_each(dataGroup, funs(mean))

# write tidy data to text file
write.table(tidy, "tidy.txt", row.name=FALSE)
