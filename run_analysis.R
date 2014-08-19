testDir = "./data/UCI HAR Dataset/test"
trainDir = "./data/UCI HAR Dataset/train"
x_test_f <- paste(testDir, "X_test.txt", sep="/")
x_test_df <- read.table(x_test_f)
x_train_f <- paste(trainDir, "X_train.txt", sep = "/")
x_train_df <- read.table(x_train_f)  ## Read up all the training and test features
x_merged_df <- rbind(x_train_df, x_test_df) ## merge the train and test data.frames
nrow(x_merged_df)
y_test_f <- paste(testDir, "y_test.txt", sep="/")
y_test_df <- read.table(y_test_f)
y_train_f <- paste(trainDir, "y_train.txt", sep="/")
y_train_df <- read.table(y_train_f)
y_merged_df <- rbind(y_train_df, y_test_df) ## do the same with the activity labels. Important to merge in the same order
features_f <- "./data/UCI HAR Dataset/features.txt"
features_df <- read.table(features_f, stringsAsFactors = FALSE) ## read up the various features
## We want to only keep the variables with mean() and std() in the variable names in the features data frame
x_merged_df2 <- x_merged_df[, grepl("mean()", features_df$V2) | grepl("std()", features_df$V2)  ]
a <- grepl("mean()", features_df$V2) | grepl("std()", features_df$V2)
## Now we do the same grepl dance for features so that we only retain the names of the mean() and std() of the various varialbles
features_mean_std <- features_df[a,][,2]
names(x_merged_df2) <- features_mean_std
## read up the train and test subjects and merge them
subjects_train_df <- read.table(paste(trainDir, "subject_train.txt", sep='/'))
subjects_test_df <- read.table(paste(testDir, "subject_test.txt", sep='/'))
subjects_merged_df <- rbind(subjects_train_df, subjects_test_df)
## Add them to the merged dataframe
x_merged_df2$Subject <- subjects_merged_df$V1
## Change the activity labels to readable string discriptions
x_merged_df2$Activity <- c(sapply(y_merged_df, function(x) { activity_labels_df[x,][[2]]}))
## melt the data frame on the Activity and Subject id variables so that we can cast it later.
mdata <- melt(x_merged_df2, id=c("Activity", "Subject"))
## cast the melted data.frame so that we can take the mean of each of the variables for each activity and each subject
ct <- cast(mdata, Activity + Subject ~ variable, mean)
## write everything in a table where the first two columns are Activity and Subject and the variables are the mean 
## of the mean variables for that Subject and that Activity.
write.table(ct, file = "./data/ct.txt", row.name=F, quote=F)
