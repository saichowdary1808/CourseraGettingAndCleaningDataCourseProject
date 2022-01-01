library(plyr)



# Read in the data from files

filename <- "final.zip"

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(fileURL, filename, method="curl")



# Checking if folder exists

if (!file.exists("UCI HAR Dataset")) { 

  unzip(filename) 

}





features     = read.table('./UCI HAR Dataset/features.txt',header=FALSE)

activityType = read.table('./UCI HAR Dataset/activity_labels.txt',header=FALSE) 

subjectTrain = read.table('./UCI HAR Dataset/train/subject_train.txt',header=FALSE)

xTrain       = read.table('./UCI HAR Dataset/train/X_train.txt',header=FALSE)

yTrain       = read.table('./UCI HAR Dataset/train/y_train.txt',header=FALSE)

subjectTest = read.table('./UCI HAR Dataset/test/subject_test.txt',header=FALSE)

xTest       = read.table('./UCI HAR Dataset/test/X_test.txt',header=FALSE)

yTest       = read.table('./UCI HAR Dataset/test/y_test.txt',header=FALSE)



# Extract the mean and standard deviation for each measurement.

meanFeatures <- grepl("mean|std", features)



# Assigin column names to the data imported above

names(subjectTest) = "subject"

names(subjectTrain) = "subject"

names(xTest) = features

names(xTrain) = features



# Merges the training and the test sets to create one data set.



xTest = xTest[,meanFeatures]

yTest[,2] = activityLabels[yTest[,1]]

names(yTest) = c("Activity_ID", "Activity_Label")



xTrain = xTrain[,meanFeatures]

yTrain[,2] = activityLabels[yTrain[,1]]

names(yTrain) = c("Activity_ID", "Activity_Label")





# Bind data

testData <- cbind(as.data.table(subjectTest), yTest, xTest)



trainData <- cbind(as.data.table(subjectTrain), yTrain, xTrain)



# Merge test and train data

mergedData = rbind(testData, trainData)



idLabels   = c("subject", "Activity_ID", "Activity_Label")

dataLabels = setdiff(colnames(data), idLabels)

allData      = melt(mergedData, id = idLabels, measure.vars = dataLabels)



#From the data set in step 4, creates a second, independent tidy data set with 

#the average of each variable for each activity and each subject

tidy_data   = dcast(allData, subject + Activity_Label ~ variable, mean)



write.table(tidy_data, file = "./tidy_data.txt")
