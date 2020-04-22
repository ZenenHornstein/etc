#!/usr/bin/bash

URL=$1
OUTPUT_NAME=$2

if [[ ! $URL ]] || [[ ! $OUTPUT_NAME ]];
then
    cat << END
Downloads a Youtube Video and saves the Audio as an mp3
***************************************************************
USAGE: $ download_only_audio URL output_file
EXAMPLE: $ download_only_audio http:youtube.com/gobble gobbleAudio
***************************************************************
END
else
    echo "Correct args"
    mkdir sound
    cd sound
    youtube-dl $URL
    ffmpeg -i "$(ls)" -c:a libmp3lame -q:a 4 $OUTPUT_NAME.mp3 

    
fi



