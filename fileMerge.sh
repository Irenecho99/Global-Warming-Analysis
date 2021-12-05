#!/bin/bash

#----------------------------------
rm allFiles.csv

# Merge all .csv files into one file
(head -1 1999.csv ; tail -n +2 -q *.csv) > allFiles.csv
