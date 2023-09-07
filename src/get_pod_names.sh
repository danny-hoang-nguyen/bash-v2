#!/bin/bash

function get_pod_names() {
    kubectl get pods | awk '{print $1}'
}

get_pod_names "$@"