X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
X_data <- rbind(X_train, X_test)

Y_train <- read.table("UCI HAR Dataset/train/Y_train.txt")
Y_test <- read.table("UCI HAR Dataset/test/Y_test.txt")
Y_data <- rbind(Y_train, Y_test)

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject_data <- rbind(subject_train, subject_test)

features <- read.table("UCI HAR Dataset/features.txt")
mean_std_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
X_data <- X_data[, mean_std_features]
names(X_data) <- features[mean_std_features, 2]
names(X_data) <- gsub("\\(|\\)", "", names(X_data))
names(X_data) <- tolower(names(X_data))

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
activity_labels[, 2] = gsub("_", "", tolower(as.character(activity_labels[, 2])))
Y_data[,1] = activity_labels[Y_data[,1], 2]
names(Y_data) <- "activity"

names(subject_data) <- "subject"
clean_data <- cbind(subject_data, Y_data, X_data)
write.table(clean_data, "combined_clean_data.txt")

uniqueSubjects = unique(subject_data)[,1]
numSubjects = length(unique(subject_data)[,1])
numActivities = length(activity_labels[,1])
numCols = dim(clean_data)[2]
result = clean_data[1:(numSubjects*numActivities), ]

row = 1
for (s in 1:numSubjects) {
  for (a in 1:numActivities) {
    result[row, 1] = uniqueSubjects[s]
    result[row, 2] = activity_labels[a, 2]
    clean_data_avg <- clean_data[clean_data$subject==s & clean_data$activity==activity_labels[a, 2], ]
    result[row, 3:numCols] <- colMeans(clean_data_avg[, 3:numCols])
    row = row+1
  }
}
write.table(result, "tidy_data.txt", row.names = FALSE)