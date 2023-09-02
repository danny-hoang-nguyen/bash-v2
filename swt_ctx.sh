#!/bin/bash

function swt_ctx() {
    kubectl config use-context $1
}

swt_ctx "$@"