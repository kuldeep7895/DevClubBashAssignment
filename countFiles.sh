#! /bin/bash
#program takes two arguments directory path and type of file
#type specifies only files to be searched
#name specifies the particular extension need be searched
find $1 -type f -name "*"$2 | wc -l