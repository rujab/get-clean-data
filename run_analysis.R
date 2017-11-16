library(dplyr); library(reshape2)
## loading files and rename the variables
xtest <- read.table("X_test.txt")
ytest <- read.table("y_test.txt")
ytest <- rename(ytest, activity=V1)
stest <- read.table("subject_test.txt")
stest <- rename(stest, subject=V1)
xtrain <- read.table("X_train.txt")
ytrain <- read.table("y_train.txt")
ytrain <- rename(ytrain, activity=V1)
strain <- read.table("subject_train.txt")
strain <- rename(strain, subject=V1)
features <- read.table("features.txt")
labels <- read.table("activity_labels.txt")
labels <- rename(labels, code=V1, name=V2)
## assembling test and train sets and merging them
test <- data.frame(stest, ytest, xtest)
train <- data.frame(strain, ytrain, xtrain)
bigdataset <- rbind(test, train)
## extract mean and standart deviation variables and making smaller dataset
featurenumber <-grep("mean\\(|std\\(", features$V2)
dataset <- select(bigdataset, subject, activity, c(featurenumber + 2))
dataset <- tbl_df(dataset)
## naming activities by using labels table
dataset <- merge(dataset, labels, by.x="activity", by.y="code")
dataset$activity <- dataset$name
dataset <- select(dataset, -name)
## replace colon names with descriptive ones extracted from features
variablenames <- as.character(features$V2[c(featurenumber)])
variablenames <- gsub("-","_", variablenames)
names(dataset) <- c("activity", "subject", variablenames)
## creating data set with the average of each variable for each activity and each subject
dataset2 <- melt(dataset, id=c("activity", "subject"), measure.vars=c(variablenames))
dataset2 <- dcast(dataset2, activity + subject ~ variable, mean)
