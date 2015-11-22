CONTENTS:
=========
This repro contains the following files:

   - README.md 		- this file
   - run_analysis.R	- a script to process the UCI HAR Dataset a produce an average of measurements by Activity and Person
   - codebook.md	- a description of the data resulting from running the "run_analysis.R" script


SCRIPTS:
========
The "run_analysis.R" script works as follows:

	- it loads various files into memory:

		- activity_labels.txt    (the names of the 6 activites, one per line)
		- features.txt		 (the names of the 561 features, one per line)

		- subject_train.txt	 (the "train" subset of the subject id's, one per line)
		- subject_test.txt	 (the "test" subset of the subject id's, one per line)

		- y_train.txt	 	 (the "train" subset of the labelled activity id data, one per line)
		- y_test.txt	 	 (the "test" subset of the labelled activity id data, one per line)

		- x_train.txt	 	 (the "train" subset of the feature data, 561 features per line)
		- x_test.txt	 	 (the "test" subset of the feature data, 561 features per line)

	- it appends the test data from the above onto the end of the train data (resulting in 2 new vectors and a new matrix).

	- it translates the "y" label data from activity id's to the character string names of the activities

	- it names the columns in the "x" feature matrix, using the "features.txt" feature name data

	- from the "x" feature matrix, it extracts the columns with "std" and "mean" in their column names

	- it creates a "df" data frame, using the subject ids, the character "y" label feature names, and the new matrix of 
	  "std" and "mean" column names

	- it then creates a new "df2" data frame by:
		- grouping the data by activity, subject id and taking the mean of the remaining columns 
		- moving the "activity" to the first column, and "subject id" to the second column
		- naming the first column "Activity.Label"
		- nameing the second column "Subject.Id"

	- it returns "df2" as the value of the function
