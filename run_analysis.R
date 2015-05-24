#------------------------------------------------------------------
# run_analysis.R
#------------------------------------------------------------------
#
# The commented numbers below refer to processing steps
# as described in the script synopsis.
# Please refer ReadMe.md for details.
#------------------------------------------------------------------

print(paste(">>> Processing starts at ", date()))

#
# Assumptions:
#   i) Packages are installed.
#  ii) Input data files are available in working directory
#

# 1. #
library(plyr)
library(data.table)
inputs  <- "./UCI HAR Dataset"
if (!file.exists(inputs)) {stop(">>> ERROR: Input data missing. See ReadMe.md for help.")}

#
# Load the raw files into R data frames
#

# 2, 3. #
print(">>> Loading data into R...")
train                       <- paste(inputs, "/train",sep="")
test                        <- paste(inputs, "/test",sep="")
test_data                   <- read.table(paste(test, "/X_test.txt", sep=""))
test_labels                 <- read.table(paste(test, "/y_test.txt", sep=""))
test_subjects               <- read.table(paste(test, "/subject_test.txt", sep=""))
train_data                  <- read.table(paste(train, "/X_train.txt", sep=""))
train_labels                <- read.table(paste(train, "/y_train.txt", sep=""))
train_subjects              <- read.table(paste(train, "/subject_train.txt", sep=""))
activity_labels             <- read.table(paste(inputs, "/activity_labels.txt", sep=""))
colnames(activity_labels)   <- c("activity_id", "activity_name")
variable_names              <- read.table(paste(inputs, "/features.txt", sep=""), stringsAsFactors=F)
print(">>> Loading data into R completed ok.")


#
# Splice it all together:
#

# 4. #
print(">>> Merging test and train datasets...")

all_data                <- rbind(train_data, test_data)
rm(train_data, test_data)

all_labels              <- rbind(train_labels, test_labels)
colnames(all_labels)    <- "activity_id"
rm(train_labels, test_labels)

all_subjects            <- rbind(train_subjects, test_subjects)
colnames(all_subjects)  <- "subject_id"
rm(train_subjects, test_subjects)


# 5. #
print(">>> Excluding unused variables...")
variable_names          <- data.table(variable_names)
required_columns        <- variable_names[V2 %like% "-mean\\(\\)" | V2 %like% "-std\\(\\)"]
all_data                <- select(all_data, required_columns[["V1"]])

# 6. #
print(">>> Assigning meaningful variable names...")
colnames(all_data)      <- required_columns[["V2"]]

# 7. #
print(">>> Complete Merging test and train datasets...")
all_data                <- cbind(all_labels, all_subjects, all_data) #activities and subjects in front

# 8. #
print(">>> Assigning meaningful activity names...")
all_data                <- merge(activity_labels, all_data, by = "activity_id")
all_data <- select(all_data, -activity_id)

# 9. #
print(">>> Create the final tidy dataset and write it out as a text file...")

all_data <- arrange(all_data, activity_name, subject_id)
final_ds <- ddply(all_data, .(activity_name, subject_id), numcolwise(mean))
write.table(final_ds, "final_ds_wide_form.txt", row.name=F)

print(paste(">>> Processing complete at ", date()))

#-----------------------------------------------------------------
# End
#------------------------------------------------------------------