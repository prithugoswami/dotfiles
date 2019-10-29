#!/usr/bin/bash

passes=$(cat "$1")
prefix="$2"
path="$3"
i=0

[ -n "$path" ] && cd $3
mkdir "$2mp4"
for a in $passes
do
    echo $a > tmp_pas
    cat tmp_pas
    gpg --passphrase-file tmp_pas --batch -o "$2mp4/$prefix$i.mp4" -d "$prefix$i.g"
    i=$(expr $i + 1)
done;
