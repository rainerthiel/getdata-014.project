# Codebook - getdata-014.project

##Input Dataset
The input dataset is not described here. This information is available elsewhere.  
For a full description see [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

##Notes on creating the output

Looked at the raw loaded data using dim() to confirm that the train and test
datasets are compatible ito combining them into single datasets.

Label and Subject files match up nicely. dim() results:
- test_labels       = 2947 / 1
- test_subjects     = 2947 / 1
- train_labels      = 7532 / 1
- train_subjects    = 7532 / 1

Dataset files also match up. dim() results:
- test_data         = 2947 / 561
- train_data        = 7532 / 561

Dataset column count also matches the number of features in features.txt

Selection of mean/std deviation variables
- looked at the feature names and decided that the relevant variables were those that included either "-mean()" or "-std()" in their names.
- Any other variables that include the string "mean" in their names are therefore excluded

##Output Dataset
### file details:
- file name: _final_ds_wide_form.txt_
- includes column headers
- there are no row headers
- number of observations: 180
- number of variables: 68

### data dictionary

**Column 1**: _activity_name_ - the activity being measured  
**Column 2**: _subject_id_ - a unique identifier of the subject being measured  
**Columns 3-68**: the average (by activity/subject) of means and standard deviations provided in the input dataset.

The names of mean and standard deviation variables extracted from the input datasets (columns 3 thru 68) are listed below:
- tBodyAcc-mean()-X
- tBodyAcc-mean()-Y 
- tBodyAcc-mean()-Z 
- tBodyAcc-std()-X
- tBodyAcc-std()-Y
- tBodyAcc-std()-Z
- tGravityAcc-mean()-X
- tGravityAcc-mean()-Y
- tGravityAcc-mean()-Z
- tGravityAcc-std()-X
- tGravityAcc-std()-Y
- tGravityAcc-std()-Z
- tBodyAccJerk-mean()-X
- tBodyAccJerk-mean()-Y
- tBodyAccJerk-mean()-Z
- tBodyAccJerk-std()-X
- tBodyAccJerk-std()-Y
- tBodyAccJerk-std()-Z
- tBodyGyro-mean()-X
- tBodyGyro-mean()-Y
- tBodyGyro-mean()-Z
- tBodyGyro-std()-X
- tBodyGyro-std()-Y
- tBodyGyro-std()-Z
- tBodyGyroJerk-mean()-X
- tBodyGyroJerk-mean()-Y
- tBodyGyroJerk-mean()-Z
- tBodyGyroJerk-std()-X
- tBodyGyroJerk-std()-Y
- tBodyGyroJerk-std()-Z
- tBodyAccMag-mean()
- tBodyAccMag-std()
- tGravityAccMag-mean()
- tGravityAccMag-std()
- tBodyAccJerkMag-mean()
- tBodyAccJerkMag-std()
- tBodyGyroMag-mean()
- tBodyGyroMag-std()
- tBodyGyroJerkMag-mean()
- tBodyGyroJerkMag-std()
- fBodyAcc-mean()-X
- fBodyAcc-mean()-Y
- fBodyAcc-mean()-Z
- fBodyAcc-std()-X
- fBodyAcc-std()-Y
- fBodyAcc-std()-Z
- fBodyAccJerk-mean()-X
- fBodyAccJerk-mean()-Y
- fBodyAccJerk-mean()-Z
- fBodyAccJerk-std()-X
- fBodyAccJerk-std()-Y
- fBodyAccJerk-std()-Z
- fBodyGyro-mean()-X
- fBodyGyro-mean()-Y
- fBodyGyro-mean()-Z
- fBodyGyro-std()-X
- fBodyGyro-std()-Y
- fBodyGyro-std()-Z
- fBodyAccMag-mean()
- fBodyAccMag-std()
- fBodyBodyAccJerkMag-mean()
- fBodyBodyAccJerkMag-std()
- fBodyBodyGyroMag-mean()
- fBodyBodyGyroMag-std()
- fBodyBodyGyroJerkMag-mean()
- fBodyBodyGyroJerkMag-std()
