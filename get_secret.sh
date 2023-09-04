#!/bin/bash

get_secret() {
  read -r -p "Exact pod name: " pod
  echo
  echo "Selected pod, $pod"
  kubectl exec "$pod" -- ls -la /vault/secrets/env
  read -r -p "Choose secret type: " sec
  kubectl exec "$pod" -- cat /vault/secrets/env/"$sec"
}

get_secret "$@"