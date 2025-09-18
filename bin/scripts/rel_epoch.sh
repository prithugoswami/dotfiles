#!/bin/bash
# Get the current Unix epoch time
now=$(date +%s)
# Parse the input relative time
if [[ "$#" -eq 0 ]]; then
    exit 1
fi

relative_time=$1
unit=${relative_time: -1}
value=${relative_time:0: -1}
# Calculate the offset in seconds based on the unit
if [ "$unit" == "h" ]; then
    offset=$((value * 3600))
elif [ "$unit" == "d" ]; then
    offset=$((value * 86400))
else
    echo "Invalid input. Please provide a relative time in hours (h) or days (d)."
    exit 1
fi
# Calculate the Unix epoch time at the relative time
epoch_time=$((now - offset))
echo $epoch_time

