#!/usr/bin/bash
# Usage : ./split-scenes.sh <file> <slicemins>
# <slicmins> is the length of each slice in mins

videofile="$1"
slicemins="$2"
mins=$(echo "ceil(`ffprobe -loglevel error -show_entries\
    format=duration -of csv $videofile | cut -d ',' -f2` / 60)" |\
    calc -p)

fldr=$(echo "$1" | cut -d '.' -f1)
[ -d "$fldr" ] || mkdir "$fldr"
for value in $(seq 0 $slicemins $(expr $mins - 1))
do
    echo $(expr $value / 2) / $(expr $(expr $mins - 1) / 2)
    ffmpeg -loglevel quiet -i "$videofile" -ss 00:$value:00\
        -t 00:$slicemins:00 -c copy\
        $fldr/$fldr`expr $value / 2`.mp4
done
