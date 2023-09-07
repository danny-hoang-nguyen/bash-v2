#!/bin/bash

function list_lib() {
    kubectl exec $1 -- ls /app/lib
}

list_lib "$@"