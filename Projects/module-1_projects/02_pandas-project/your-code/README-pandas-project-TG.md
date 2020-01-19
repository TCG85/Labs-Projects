

# Project: Data Cleaning and Manipulation with Pandas

## Process:

* Import pandas and numpy
* Import CSV File, creating Dataframe (df) and creating copy of this Dataframe that we will apply the changes to (df_clean). This helps us to avoid manipulating original data or manipulating the original data wrongly.
* Show head to get overview of table
* Show data types
* Show insights of columns with int/float
* Creating index (can be don but not needed)
* Cleaning column headers
* Show # of missing values per column to decide if/which columsn to drop immediately
* Deep dive into rows with missing values (excluding rows that do not contain missing values)
* Calculating percentage of missing values - decision to drop or to fill missing values (interpolation)
* Checking/comparing other columns and define action points what to do with data in each of them/with the column itself
    * Removing duplicates (=rows)
    * Checking data of every column
        * either clean data
        * change format of data
        * compare column iwth other column - decide if one of hte columns can be deleted
        * renaming of column header
* Change sort order of columns (if needed)
* Reset index as rows were deleted
* Check final data
* Save file to *.csv


