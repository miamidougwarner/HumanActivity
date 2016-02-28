# Codebook.md

##Getting and Cleaning Data Course Project Codebook

###Top level executing script:

run_analysis.R - top level script showing each project question and the code that answers it.


###Functions supporting top level script:

These functions must be sourced prior to executing run_analysis.R:

download.project.data.R - retrieves the experiment files from the URL provided in the assignemnt. The files are available as a zip file. This function downloads the zip file, and unpacks it in a directory (destination.dir).

get.activity.data.R - reads and loads the activity identifiers (IDs) into their own data frame.

get.activity.label.table.R - reads and loads the activity descriptions (walking, sitting, etc.) into their own data frame.

get.measurements.R - reads and loads the normalized [-1..1] values for each of the 561 measures.

get.volunteer.data.R - reads and load the list of volunteer (subject) identifiers.


##Script Variables
destination.file - URL for the project dataset

destination.dir - directory on my local machine where the data shall be saved and accessed.


##Intermediate Variables
feature.table - reads and loads the 561 types of measurements taken. 
unique.column.names - Output from make.names() on the 561 values in feature.table. R has specific requirements for column names.

[training/test].measurements - contain the 561 normalized values for each activity and each volunteer.

activity.label.table - contains the mapping for the activity identifiers. eg. "walking" & "sitting"

[training/test].activities - contains the activity IDs (activity numbers).

[training/test].volunteers - contains the volunteer IDs (subjects/volunteers number from 1-30.)

[training/test].dataset - the combination of volunteers, activities and measurements

all.volunteers.dataset - the combination of the training.dataset and test.dataset

all.volunteers.mean.std - The result of the all.volunteers.dataset with only the mean() and std() related columns.

all.volunteers.mean - The standard deviation columns have been removed from all.volunteers.mean.std.

temp - adds a means column  with all average of all the normalized mean values.
temp.means - Only need: volunteer.id, activity.description & means columns
temp.melt - Melt the dataset. Force the column 'means' into the 'value' column

consolidated.mean.by.activity - Associate the means value for each volunteer and for each activity

output.file.name - file system destination for the tidy dataset


