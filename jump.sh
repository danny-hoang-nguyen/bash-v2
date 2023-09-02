#!/bin/bash

function jump() {
    kubectl exec -i -t $1 -- /bin/bash
}

jump "$@"