#!/bin/bash

# this script will consume -n your_value -s your_next_value and print them out
# sh consume_params.sh -n input -s another_input
while getopts n:s: flag
do
    case "${flag}" in
        n) nOption=${OPTARG};;
        s) sOption=${OPTARG};;
        *) echo "UNKNOWN ARG";;
    esac
done
 echo "value of -n: $nOption";
 echo "value of -s: $sOption";
