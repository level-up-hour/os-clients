#!/bin/bash

cd /workdir

case $1 in

  oc)
    /opt/openshift/oc "${@:2}"
    ;;

  helm)
    /opt/helm/helm-linux-amd64 "${@:2}"
    ;;

  template2helm)
    /opt/template2helm/linux-amd64-template2helm  "${@:2}"
    ;;

  help | *)
    if [ $1 != "help" ]; then
      echo "\"$1\" is not a supported command."
    fi
    echo "Available commands are: oc, helm, template2helm"
    ;;

esac
