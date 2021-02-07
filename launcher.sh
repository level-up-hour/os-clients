#!/bin/bash

cd /workdir

case $1 in

  oc)
    /opt/openshift/oc "${@:2}"
    ;;

  helm)
    /opt/helm/helm "${@:2}"
    ;;

  template2helm)
    /opt/template2helm/linux-amd64-template2helm  "${@:2}"
    ;;

  help | *)
    echo "\"$1\" is not a supported command."
    echo "Available commands are: oc, helm, template2helm"
    ;;
esac
