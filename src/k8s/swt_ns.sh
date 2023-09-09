#!/bin/bash

function swt_ns() {
    kubectl config set-context --current --namespace=$1
}

swt_ns "$@"