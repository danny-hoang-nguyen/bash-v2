#!/bin/bash

config_map() {
  kubectl get configmap
}
config_map "$@"
