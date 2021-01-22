#!/bin/bash

cd /workdir

case $1 in

  oc)
    /opt/openshift/oc "${@:2}"
    ;;

  helm)
    /opt/helm/helm "${@:2}"
    ;;

  *)
    echo "$1 is not a supported command"
    ;;
esac
