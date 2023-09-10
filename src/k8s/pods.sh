#!/bin/bash

function pods() {
    kubectl get pods | awk '{print $1}'
}

pods "$@"