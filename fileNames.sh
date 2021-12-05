#!/bin/bash

#------------------------------------------
# List all files and prepare for the data processing.

ls ./data | sed -e 's/clean_data_//g' | sed -e 's/.csv//g' > inputFileNames
