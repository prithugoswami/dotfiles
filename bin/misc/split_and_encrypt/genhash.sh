#!/usr/bin/bash

# generate random md5 hashes using /dev/urandom

for value in $(seq 0 $(expr $1 - 1))
do
    md5sum=$(dd status=none if=/dev/urandom bs=16 count=2 | md5sum |\
        cut -d ' ' -f 1 )
    # just using 16 chars of the hash
    echo ${md5sum::16}
done
