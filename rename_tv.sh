#!/bin/bash
#
# SCRIPT:	rename_tv.sh
# AUTHOR:	s7ntax
# DATE:		26-08-2016
# REV:		1.1.A
# PLATFORM:	Not platform dependent
#
# PURPOSE:	This script will rename TV Show files in pwd to the format S01E01
# 		provided the season number and episode number are present in the
# 		the correct order at the start of the original filename, disregarding
# 		all other numbers and  maintaining the original extension.
#

if [ $? == 1 ]; then
	exit
fi

# Define regex

reg='^([^0-9]*)([0-9][0-9]*)[^0-9]*([0-9][0-9]*).*(\....)$'

# Start a for loop

for filename in *.*; do
	  if [[ $filename =~ $reg ]]; then
		      printf -v newname 'S%02dE%02d%s' "$((10#${BASH_REMATCH[2]}))" "$((10#${BASH_REMATCH[3]}))" "${BASH_REMATCH[4]}"
		          mv -n "$filename" "$newname"
			fi
		done
	exit
