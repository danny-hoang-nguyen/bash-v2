#!/bin/bash

function find_pod() {
    kubectl get pods | grep $1 | awk '{print $1}'
}

find_pod "$@"