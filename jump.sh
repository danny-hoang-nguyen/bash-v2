#!/bin/bash

function jump() {
    kubectl exec -i -t $1 -- /bin/bash
}

jump "$@"
# TODO: get context, switch context, get namespace, switch namespace, restart service