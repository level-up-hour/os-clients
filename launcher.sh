#!/bin/bash
cd /workdir

case $1 in

  oc)
    /opt/openshift/oc "${@:2}"
    ;;

  kubectl)
    /opt/openshift/kubectl "${@:2}"
    ;;

  helm)
    /opt/helm/helm-linux-amd64 "${@:2}"
    ;;

  template2helm)
    /opt/template2helm/linux-amd64-template2helm  "${@:2}"
    ;;

  odo)
    /opt/odo/odo "${@:2}"
    ;;

  argocd)
    /opt/argocd/argocd "${@:2}"
    ;;

  s2i)
    /opt/s2i/s2i "${@:2}"
    ;;

  help | *)
    if [ $1 != "help" ]; then
      echo "\"$1\" is not a supported command."
    fi
    echo "Available commands are: oc, helm, template2helm, odo, kubectl, argocd"
    ;;

esac
