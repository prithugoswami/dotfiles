#!/usr/bin/bash

passes=$(cat "$1")
prefix="$2"
path="$3"
i=0

[ -n "$path" ] && cd $3
mkdir "$2.g"
for a in $passes
do
    echo $a > tmp_pas
    cat tmp_pas
    gpg --passphrase-file tmp_pas --batch -o "$2.g/$prefix$i.g" -c "$prefix$i.mp4"
    i=$(expr $i + 1)
done;
rm tmp_pas
