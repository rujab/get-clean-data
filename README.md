# get-clean-data
getting and cleaning data course project

The raw data was taken from the dataset in file:

getdata_projectfiles_UCI HAR Dataset.zip

My script creates a new dataset based on the raw data. I used the following files from the raw dataset, which are enough for the goal of the project:

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

'train/y_train.txt': Training labels. 

'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

- 'test/X_test.txt': Test set.

'test/y_test.txt': Test labels.

- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 


I assembled the ‘test’ files and ‘train’ files and merged both tables by rows to present all subjects and because for this project there is no need to divide them.
I also reduced the dataset to one with only variables on the mean and standard deviation for each measurement. 
By using ‘activity_labels.txt’ and ‘features.txt’ I gave the activities and measurements descriptive names.
The resulting dataset, named ‘dataset2’, contains 6 groups of activities, each of them with the average of each variable for each subject and meets the requirements for tidy data, because each variable is in one column, each different record is in a different row, there is a row at the top with variable names, wich are readable.
