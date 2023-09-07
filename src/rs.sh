#!/bin/bash

function rs() {
while getopts n:s: flag
do
    case "${flag}" in
        n) namespace=${OPTARG};;
        s) service=${OPTARG};;
        *) echo "UNKNOWN ARG";;
    esac
done

#  -n namespace configmap, kubectl get configmap if u dont know
    kubectl rollout restart deployment -n $namespace $service
}

rs "$@"
