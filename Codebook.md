1. Each of the variables tBodyAcc, tGravityAcc, tBodyAccJerk, tBodyGyro, tBodyGyroJerk are measured for all the three X, Y and Z axes.
2. The first two variables of the data are Activity (Laying, Sitting, Standing, Walking and Walking_Upstairs) and Subject (goes from 1 to 30)
3. The next 30 variables are the variables listed in 1. split into X, Y and Z axes. The variables are *means* of the *means* of the variables listed in 1 followed by the *means* of the *standard deviations* of the variables listed in 1. The means are taken with respect to the Activity and Subject id variables.
4. The next set of variables contains the means with respect to the Activity and Subject id varialbes for the means of tBodyAccMag, tGravityAccMag, tBodyAccJerkMag tBodyGyroMag and tBodyGyroJerkMag. Also, they contain the means of the standard deviations for the variables.
5. The next set of variables are fBodyAcc, fBodyAccJerk and fBodyGyro. They are XYZ variables and are laid out as the variables in number 3 above.
6. Final set of variables are fBodyAccMag, fBodyAccJerkMag, fBodyGyroMag and fBodyGyroJerkMag and are laid out as 4 above.

In total, there are 81 variables (counting the Subject and Activity id variables)

Note: Hopefully the above explaination gives an idea as to how the data is laid out. Ideally, one would go variable by variable and describe them all. I just thought that that time would probably be better spent in reading up the plyr tutorial. :)
