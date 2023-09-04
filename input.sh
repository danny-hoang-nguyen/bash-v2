#!/bin/bash

while getopts n:s: flag
do
    case "${flag}" in
        n) pod_name=${OPTARG};;
        s) secret=${OPTARG};;
        *) echo "UNKNOWN ARG";;
    esac
done
 echo "name: $pod_name";
 echo "sec: $secret";
