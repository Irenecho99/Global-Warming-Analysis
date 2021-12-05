# Stat605-Final-Project
UW-Madison Stat605 Final Project

Global Warming Analysis

To do list:
- Separately download files -> .sub file + .sh file.
- .sh file to run Rscript to clean the data, e.g. select used columns, filter only US, omit NA.
- Same .R file to calculate overall average of temperature for each year. => Now we have 40 cleaned datasets
- .sh Collect all cleaned dataset into one big dataset.
- .sh file for using the dataset preparing for Logistic regression.
- .R file for performing Logistic regression.
- .dag file to run scrip sequentially. 


Procedures (Updated December 2nd, 2021)
1. Upload separated files into CHTC.
2. Create .sub file and .sh to download each file and use R to calculate average temperature for each file.
3. Merge all processed files into one dataset and upload on GitHub.
4. Create new column called "is_overheat" labeled as 0 and 1 by comparing TOBS to the previous year avg temperature.
5. Perform data analysis and model the data (Binary logistic regression)
