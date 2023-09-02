#!/bin/bash

function get_pods() {
    kubectl get pods -A
}

get_pods "$@"