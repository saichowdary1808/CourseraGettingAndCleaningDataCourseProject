---

title: "CodeBook"

date: "01/01/2022"

---

# CodeBook for Getting and Cleaning Data Course Project

## Variables



    - features contains the data of the features.txt

    - activityType contains the data of the activity_labels.txt

    - subjectTrain contains the data of the subject_train.txt

    - xTrain contains the data of the x_train.txt

    - yTrain contains the data of the y_train.txt

    - subjectTest contains the data of the subject_test.txt

    - xTest contains the data of the x_test.txt

    - yTest contains the data of the y_test.txt

    - xdata merges the data of xTrain and xTest

    - ydata merges the data of yTrain and yTest

    - subjectData merges the data of subjectTrain and subjectTest

    - allData merges the data of xdata, ydata and subjectData

    - averagesData result data



## Steps



    - Read in the data from files

    - Assigin column names to the data imported above

    - Merges the training and the test sets to create one data set

    - Extracts only the measurements on the mean and standard deviation for each measurement

    - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
