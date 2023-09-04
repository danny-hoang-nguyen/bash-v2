#!/bin/bash

function rs() {
#  -n namespace configmap, kubectl get configmap if u dont know
    kubectl rollout restart deployment -n $1 $2
}

rs "$@"