#!/bin/bash

function ns() {
    kubectl get namespace
}

ns "$@"