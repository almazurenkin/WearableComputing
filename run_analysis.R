# Defining string constant with path to the data set directory
datasetDir <- "./data/UCI HAR Dataset/"

# Reading features and descriptive activity labels
features <- read.table(paste(datasetDir, "features.txt", sep = ""), stringsAsFactors=F)
activities <- read.table(paste(datasetDir, "activity_labels.txt", sep = ""), stringsAsFactors=F)

# Reading training data set, its labels and subjects
trainingData <- read.table(paste(datasetDir, "train/X_train.txt", sep = ""))
trainingLabels <- read.table(paste(datasetDir, "train/y_train.txt", sep = ""))
trainingSubjects <-read.table(paste(datasetDir, "train/subject_train.txt", sep = ""))

# Reading test data set, its labels and subjects
testData <- read.table(paste(datasetDir, "test/X_test.txt", sep = ""))
testLabels <- read.table(paste(datasetDir, "test/y_test.txt", sep = ""))
testSubjects <- read.table(paste(datasetDir, "test/subject_test.txt", sep = ""))

# Asigning meaningful names to variables in both training and test data sets
names(trainingData) <- features[[2]]
names(testData) <- features[[2]]

# Adding subjects and labels columns to the training and test measurment data sets
trainingData$Subject <- trainingSubjects[[1]]; trainingData$Label <- trainingLabels[[1]]
testData$Subject <- testSubjects[[1]]; testData$Label <- testLabels[[1]]

# (1) Mergning training and test data sets into one
data <- rbind(trainingData, testData)

# Release memory by removing unnecessary objects
rm(trainingData); rm(trainingLabels); rm(trainingSubjects)
rm(testData); rm(testLabels); rm(testSubjects)

# (2) Extracting only the measurements on the mean and standard deviation for each measurement
data <- data[, grepl("mean\\(\\)|std\\(\\)|Subject|Label", names(data))]

# (3) Labeling the data set with descriptive activity names
data$Activity <- activities[data$Label, 2]

# Writing tidy data set to the file independent_tidy_data.txt
write.table(data, paste(datasetDir, "../tidy_data.txt", sep=""))

# (5) Creating independent tidy data set with the average of each variable for each activity and each subject
library(reshape2)
# Melting our data so that all 66 variables / features become measures of a "variable" dimension
# Note we exclude "Activity", "Subject", and "Label" from "variable" dimension
buffer <- melt(data, id.vars = c("Activity", "Subject"), measure.vars = setdiff(names(data), c("Activity", "Subject", "Label")))
# Applying mean() to each variable per Activity, per Subject
independentTidyData <- dcast(buffer, formula = Activity + Subject ~ variable, fun.aggregate = mean); rm (buffer)

# Writing independent tidy data set to the file independent_tidy_data.txt
write.table(independentTidyData, paste(datasetDir, "../independent_tidy_data.txt", sep=""))