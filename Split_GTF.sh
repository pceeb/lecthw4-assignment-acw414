#!/bin/bash

#This script will be run in the following way: sh Split_GTF.sh <filename>.gtf
#This will start by searching the file for all unique occurences in the 1st collumn, and will save these unique occurences in a list called 'chrom'
#Then for each element in chrom, the script will:
	# Make a directory called <element name>_gtf
	# Grab all lines that include the element from <filename>.gtf and save them in a file called <element name>.gtf
	# Move the file <element name>.gtf into the dirctory <element name>_gtf
#The script will repeat this for all elements in chrom (AKA all unique occurences that happen in the 1st collumn of <filename>.gtf) 

# Very nice !!!!!!!!
chrom=$(cut -f 1 $1 | uniq)
for i in ${chrom[@]}
do
mkdir ${i}_gtf
grep -P "${i}\t" $1 > ${i}.gtf
mv ${i}.gtf ${i}_gtf
done

