#!/bin/bash

function pods() {
    kubectl get pods -A
}

pods "$@"