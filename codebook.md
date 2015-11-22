This file describes the data resulting from running the "run_analysis.R" script against the UCI HAR Dataset. The suggested name for this data is "averagesByActivityAndSubject".

ORIGINAL DATA:
==============
The orginal data in the UCI HAR Dataset are sensor measurements of 30 human subjects performing 1 of 6 activies over time:
	- walking
	- walking upstairs
	- walking downstairs
	- sitting
	- standing
	- laying

The original data was processed to provide 561 features at each time step (10299 total time steps).  The features, subject ids, and label files, each with 10299 rows/timesteps, was then divided into "train" and "test " subsets.  You can refer to "README.txt" and other files in the UCI HAR Dataset for more information about the specific features, their units, and how they were created.

AVERAGES BY ACTIVITY AND SUBJECT DATA:
======================================
The data described by this file represents an AVERAGE of the test and train feature data, GROUPED by activity and subject.  Only the feature columns whose names contain "std" or "mean" are included in this data.

COLUMNS:
========
The data contains the following columns:
	Activity.Label		- the activity label name
	Subject.Id		- the id of the subject
	<79 feature columns>	- each column contains the AVERAGE of its grouped values, for the current Activity and Subject

The 79 feature columns represent the subject of features whose names contain "std" or "mean".




