#! /bin/bash
#program takes two arguments directory path and type of file
#maxdepth specifies the level upto which search need to be made
#type specifies only files to be searched
#name specifies the particular extension need be searched
find $1 -maxdepth 1 -type f -name "*"$2 | wc -l