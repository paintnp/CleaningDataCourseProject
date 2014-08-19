CleaningDataCourseProject
=========================

Course project for Cleaning Data Coursera course
1. Read up all the training and test features
2. Merge the train and test data.frames created in 1
3. Do the same with the activity labels. Important to merge in the same order
4. Read up the various features
5. We want to only keep the variables with mean() and std() in the variable names in the features data frame. Use Grepl to keep the variables with mean() and std() in them
6. Now we do the same grepl dance for features so that we only retain the names of the mean() and std() of the various varialbles
7. read up the train and test subjects and merge them
8. Add them to the columns of the merged dataframe
9. Change the activity labels to readable string discriptions
10. Melt the data frame on the Activity and Subject id variables so that we can cast it later.
11. Cast the melted data.frame so that we can take the mean of each of the variables for each activity and each subject
12. Write everything in a table where the first two columns are Activity and Subject and the variables are the mean of the mean variables for that Subject and Activity
