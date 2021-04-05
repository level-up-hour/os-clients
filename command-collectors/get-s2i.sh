#!/bin/bash

COMMAND="s2i"
TARBALL="source-to-image-linux-amd64.tar.gz"

mkdir /opt/$COMMAND
cd /opt/$COMMAND
DL_URL=$(curl --user "langdon:" -s https://api.github.com/repos/openshift/source-to-image/releases/latest \
            | grep browser_download_url \
            | grep linux-amd64 \
            | cut -d '"' -f 4)
curl -sSL -o /opt/$COMMAND/$TARBALL $DL_URL
tar -xf $TARBALL
ln -s $PWD/$COMMAND /usr/local/bin/
chmod +x $PWD/$COMMAND