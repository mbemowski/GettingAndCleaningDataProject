# Coursera Getting and Cleaning Data Project

## Files
* README.md - this readme file
* CodeBook.md - codebook describing the tidy result of the transformations
* run_analysis.R - script that performs the whole analysis process, described below

## run_analysis.R
* First, the metadata for the dataset is loaded to labels and features variables.
* Next x, y and subject data for test and train set is read from disk into data frames.
* Then train and test set are merged together into three larger data frames.
* Columns containing standard deviation and mean values are selected by using regular
  expression from the names of the features.
* Next, activities codes are mapped to names by using mapvalues function from plyr package.
  Data frames are merged into one bigger table with  appriopiate columns names.
* Finally the data is grouped by subject and activity and then summarised using mean function.

Resulting tidy set is written to tidy.txt file.
