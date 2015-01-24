#install.packages("plyr");
library("plyr");
library("data.table")

features <- read.table("./UCI HAR Dataset/features.txt", col.names=c("Feature.ID", "Feature.Name"));
activities <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names=c("Activity.ID", "Activity.Name"));

test_data <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names=as.vector(features$Feature.Name), check.names=TRUE);
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names=c("Subject.ID"));
activity_test <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names=c("Activity.ID"));
test_data <- cbind(Activity.ID=activity_test$Activity.ID, test_data);
test_data <- cbind(Subject.ID=subject_test$Subject.ID, test_data);
test_data <- as.data.frame(test_data);

train_data <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names=as.vector(features$Feature.Name), check.names=TRUE);
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names=c("Subject.ID"));
activity_train <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names=c("Activity.ID"));
train_data <- cbind(Activity.ID=activity_train$Activity.ID, train_data);
train_data <- cbind(Subject.ID=subject_train$Subject.ID, train_data);
train_data <- as.data.frame(train_data);

all_data <- merge(test_data, train_data, all=TRUE);
v_names <- as.vector(names(all_data));

logical_mean <- grepl("mean", names(all_data));
mean_cols <- v_names[logical_mean];
mean_data <- all_data[mean_cols];

logical_std <- grepl("std", names(all_data));
std_cols <- v_names[logical_std];
std_data <- all_data[std_cols];

subject_data <- all_data$Subject.ID;
activity_data <- all_data$Activity.ID;

filtered_data <- data.frame(subject_data, activity_data, mean_data, std_data);

for(a_id in activities$Activity.ID) { 
        filtered_data$activity_data[filtered_data$activity_data == a_id] <- as.character(activities[activities$Activity.ID == a_id, ]$Activity.Name) 
}

filtered_data <- rename(filtered_data, c(subject_data = "Subject.ID", activity_data = "Activity.Name"))

old_names <- as.vector(colnames(filtered_data));
new_names <- tolower(gsub("\\.\\.", "", old_names));
names(filtered_data) <- new_names;

dt <- data.table(filtered_data);
dt2 <- dt[, lapply(.SD,mean), by=subject.id,activity.name];

write.table(dt2, file="./avg_tidy_data.txt", row.name=FALSE);

