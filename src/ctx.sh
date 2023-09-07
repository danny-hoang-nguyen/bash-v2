#!/bin/bash

function ctx() {
    kubectl config get-contexts
}

ctx "$@"