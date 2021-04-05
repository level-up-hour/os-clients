#!/bin/bash

mkdir /opt/argocd || :
cd /opt/argocd
VERSION=$(curl --user "langdon:" --silent "https://api.github.com/repos/argoproj/argo-cd/releases/latest" | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/')
curl --user "langdon:" -sSL -o /opt/argocd/argocd https://github.com/argoproj/argo-cd/releases/download/$VERSION/argocd-linux-amd64
ln -s $PWD/argocd /usr/local/bin/ || :
chmod +x /opt/argocd/argocd
