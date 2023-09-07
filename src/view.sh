#!/bin/bash
function main() {
  printf "No-arg cmds are below: \n 1.listing pod \n 2.listing ns \n 3.listing configmap \n 4.listing context \n"
  read -r -p "Choose program: " opt
  case $opt in
  1)
    echo "all pods"
    sh get_pod_names.sh
    ;;

  2)
    echo "all namespaces"
    sh ns.sh
    ;;

  3)
    echo "all configmap in current namespace"
    kubectl get configmap
    ;;

  4)
    echo "all contexts"
    sh ctx.sh
    ;;
  *)
  echo "not supported"
  exit 1
  ;;
  esac
}

main "$@"
