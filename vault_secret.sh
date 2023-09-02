#!/bin/bash

function vault_secret() {
    
    while getopts n:s: flag
    do
        case "${flag}" in
            n) pod_name=${OPTARG};;
            s) secret=${OPTARG};;
        esac
    done

    kubectl exec $pod_name -- ls -la /vault/secrets/env
    kubectl exec $pod_name -- cat /vault/secrets/env/$secret
}

vault_secret "$@"