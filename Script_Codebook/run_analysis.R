##### Step - 0: Reading the training and test datasets

train <- read.table(file = "...\\Course Project\\train\\X_train.txt", header = FALSE)
test <- read.table(file = "...\\Course Project\\test\\X_test.txt", header = FALSE)

##### Step - 0: Reading dataset with column names (features) and assigning it to the train and test dataset 

column_names <- read.table(file = "...\\Course Project\\features.txt", header = FALSE, stringsAsFactors = FALSE)

colnames(train) <- column_names[[2]]
colnames(test) <- column_names[[2]]

##### Step - 0: Reading subjects data and naming the column

train_subjects <- read.table(file = "...\\Course Project\\train\\subject_train.txt", header = FALSE)
test_subjects <- read.table(file = "...\\Course Project\\test\\subject_test.txt", header = FALSE)
colnames(train_subjects) <- "Subjects"
colnames(test_subjects) <- "Subjects"

##### Step - 0: Reading activity data and naming the column

train_activ <- read.table(file = "...\\Course Project\\train\\Y_train.txt", header = FALSE)
test_activ <- read.table(file = "...\\Course Project\\test\\Y_test.txt", header = FALSE)
colnames(train_activ) <- "Activity"
colnames(test_activ) <- "Activity"

##### Step - 0: Including subject ID and activity on each dataset

train <- cbind(train, train_subjects, train_activ)
test <- cbind(test, test_subjects, test_activ)

##### Step - 1: Merging the data by rows (Since the test data set is complimentary to the train dataset)

raw <- rbind(test, train)

##### Step - 2: Selecting only the variables that contain the mean or standard deviation of a measurement

## It is not clear on the instructions if we are supposed to keep the activity variable or the subjects ID. I chose to keep them
# to make my work easier on the next steps

mean_std <- grepl("mean\\()|std\\()|Activity|Subjects", colnames(raw))
raw <- raw[, mean_std]

##### Step - 3: Naming the activities on the dataset

raw$Activity <- factor(raw$Activity, levels = c(1:6), labels = c("Walking", "WalkingUpStairs", "WalkingDownStairs",
                                                                    "Sitting", "Standing", "Laying"))

##### Step - 4: Renaming the variables

names_tidy <- colnames(raw)
names_tidy <- gsub("mean\\()", "Mean", names_tidy)
names_tidy <- gsub("std\\()", "Std", names_tidy)

## I decided to keep the second '-' because, although it might make it worse to type or understand the variable name, 
# in my opinion, it makes it easier to read the variables
names_tidy <- sub("-", "", names_tidy) 

names_tidy <- sub("^f", "FFT", names_tidy)
names_tidy <- sub("^t", "Time", names_tidy)

### Step - 4: Applying the new names to the raw data set (Now Tidy!!)

tidy <- raw
colnames(tidy) <- names_tidy

### Step - 5: Reshaping the data and summarising the values of each variable for each activity and for each subject

library(reshape2)

tidy_melt <- melt(tidy, id = c("Subjects", "Activity"))
tidy_reshaped <- dcast(tidy_melt, Subjects + Activity ~ variable, mean)

write.table(tidy_reshaped, file="...\\Course Project\\tidy_reshaped.txt", row.names = FALSE)
