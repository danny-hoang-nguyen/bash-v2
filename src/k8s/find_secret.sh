#!/bin/bash

find_secret() {
#  not_found="NotFound"
  read -r -p "Which service you want to search? " pod
  echo "Input pod name to search -> $pod"
  exact_name="$(sh find_pod.sh $pod | awk 'NR == 1 {print}')"

  if [[ AB$exact_name == "AB" ]]; then
    echo "Not found pod called $pod."
    exit 1
  else
    echo "All secrets pod $exact_name has: "
    kubectl exec $exact_name -- ls -la /vault/secrets/env
    read -r -p "Choose secret type: " sec
    kubectl exec "$exact_name" -- cat /vault/secrets/env/"$sec"
  fi

#  echo "Selected pod -> $exact_name"
#  result="$(kubectl exec $exact_name -- ls -la /vault/secrets/env)"
#
#  if [[ $result == *"$not_found"* ]]; then
#    echo "Not found pod $exact_name."
#    exit 1
#  else
#    echo "All secrets pod $exact_name has: "
#    kubectl exec $exact_name -- ls -la /vault/secrets/env
#    read -r -p "Choose secret type: " sec
#    kubectl exec "$exact_name" -- cat /vault/secrets/env/"$sec"
#  fi
}

find_secret "$@"
