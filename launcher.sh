#!/bin/bash
cd /workdir

case $1 in

  oc)
    /opt/openshift/oc "${@:2}"
    ;;

  kubectl)
    /opt/openshift/kubectl "${@:2}"
    ;;

  odo)
    /opt/odo/odo "${@:2}"
    ;;

  help | *)
    if [ $1 != "help" ]; then
      echo "\"$1\" is not a supported command."
    fi
    echo "Available commands are: oc, odo, kubectl"
    ;;

esac
