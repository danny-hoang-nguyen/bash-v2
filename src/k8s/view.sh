#!/bin/bash
function main() {
  printf "No-arg cmds are below: \n 1.pod \n 2.namespace \n 3.configmap \n 4.context \n"
  read -r -p "Choose program: " opt
  case $opt in
  1)
    echo "all pods"
    sh podsa.sh
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
