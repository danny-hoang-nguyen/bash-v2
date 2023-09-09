#!/bin/bash

function rs() { # rs -n namespace -s service
while getopts n:s: flag
do
    case "${flag}" in
        n) namespace=${OPTARG};;
        s) service=${OPTARG};;
        *) echo "UNKNOWN ARG";;
    esac
done

    kubectl rollout restart deployment -n $namespace $service
}

rs "$@"
