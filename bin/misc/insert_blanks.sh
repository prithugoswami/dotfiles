#!/bin/bash

if [ $# -ne 2 ]
then
  exit $E_BADARGS
else

  COMMSTR=''
  SEQ="$1"
  j="1-"
  l=""
  for i in $SEQ;
  do
    COMMSTR="$COMMSTR A$j$i B1 " 
    j=$(expr $i + 1)
    j="$j-"
    l=$i
  done
  l=$(expr $l + 1)
  COMMSTR="$COMMSTR A$l-end" 

  $(pdftk A=$2 B=blank_lttr.pdf cat $COMMSTR output 'mod_'$2)
  # $(rm pageblanche.pdf && rm 'mod_'$1)

fi
