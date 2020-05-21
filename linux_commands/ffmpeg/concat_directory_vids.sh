#!/bin/bash
shopt -s extglob

FILE_TYPE=$2
VID_DIR=$1
IN_FILE=INPUT.txt
OUT_FILE=OUTPUT.$FILE_TYPE


#Prepare ffmpeg input file
if [[ ! $FILE_TYPE ]] || [[ ! $VID_DIR ]]
then
echo -e "Please specify a video_dir and file_type. These options are required\n"
cat << END
***************************************************************
USAGE: $ concat_directory_vids video_dir file_type
EXAMPLE: $ concat_directory_vids videos mp4
***************************************************************
END
else
	echo "All options set correctly." 
	for file in $(ls $VID_DIR/*.$FILE_TYPE -sort | awk '{print $9}'); do echo file $PWD/$file >> $IN_FILE; done
	echo "Source clips gathered succesfully.. Concatenating"
	sleep 2
	ffmpeg -f concat -safe 0 -i $IN_FILE -c copy $OUT_FILE
fi

