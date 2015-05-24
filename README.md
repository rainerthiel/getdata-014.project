# getdata-014.project

This repository contains my submission for the _Getting and Cleaning Data_ Course Project May 2015.

This ReadMe file includes the following:
- A description of the project environment
- Package dependencies
- Some assumptions
- A description of the runAnalysis.R script

There is a separate Codebook.txt files that describes the output dataset.

## Environment
- Intel Core i5 @ 1.6GHz; 4GB RAM; 256GB SSD
- Windows 7 Home Premium SP1
- R version 3.1.3 (2015-03-09)
- RStudio Version 0.98.1103

## Package Dependencies
- plyr
- data.table

## Assumptions
- the script can be run offline, that is:
 - the raw input dataset has been downloaded and unzipped into the working directory (where the script is located). The script is not expected to access input data from the downloaded zip file directly. If the inputs folder is not found, the script reports the error and stops.
 - all required packages are already installed

## Script Synopsis
1. Loads libraries and checks for data input folder. Exits with error message if not found.
2. Loads raw test and train data files into R data frames.
 1. experimental observations
 1. activities
 1. subjects
3. Loads supporting datainto R data frames
 1. activity labels
 1. feature names (variables)
4. Combines all test and train datasets
 1. combine train_ and test_ data - the experimental observations
 1. combine train_ and test_ labels and assign a meaningful variable name
 1. combine train_ and test_ subjects and assign a meaningful variable name
5. Trim all_data down to the required variables - means and std deviations only.
6. Assigns meaningful variable_names to all_data column names. Uses the variable names provided in features.txt
7. Column binds subjects and labels onto all_data
8. Merges activity labels onto all_data and drops the activity_id column
9. Creates the final tidy dataset and writes it out.
 1. Sort the data into activity / subject sequence
 2. Reshape into summarised data
 3. Output data is in the wide data form.
