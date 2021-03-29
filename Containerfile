FROM registry.access.redhat.com/ubi8-minimal

# first row tools needed in container
# second row for undeclared deps of tools -- rsync reqd for oc rsync cmd
RUN microdnf install -y tar gzip bzip2 \ 
    rsync findutils git && \ 
    microdnf clean all

RUN mkdir /opt/helm && \
    cd /opt/helm && \
    curl -L -O https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/helm/latest/helm-linux-amd64.tar.gz && \
    tar -xf helm-linux-amd64.tar.gz && \
    ln -s $PWD/helm /usr/local/bin/ && \
    rm helm-linux-amd64.tar.gz

RUN mkdir /opt/openshift && \
    cd /opt/openshift && \
    curl -L -O https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/oc/latest/linux/oc.tar.gz && \
    tar -xf oc.tar.gz && \
    ln -s $PWD/oc /usr/local/bin/ && \
    ln -s $PWD/kubectl /usr/local/bin/ && \
    rm oc.tar.gz

RUN mkdir /opt/template2helm && \
    cd /opt/template2helm && \
    curl -L -O https://github.com/redhat-cop/template2helm/releases/download/v0.1.0/linux-amd64-template2helm.bz2 && \
    bunzip2 linux-amd64-template2helm.bz2 && \
    ln -s $PWD/template2helm /usr/local/bin/ && \
    chmod a+x linux-amd64-template2helm

RUN mkdir /opt/odo && \
    cd /opt/odo && \
    curl -L -O https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/odo/latest/odo-linux-amd64.tar.gz && \
    tar --no-same-owner -xf odo-linux-amd64.tar.gz && \
    ln -s $PWD/odo /usr/local/bin/ && \
    rm odo-linux-amd64.tar.gz

RUN mkdir /opt/argocd && \
    cd /opt/argocd && \
    ver=$(curl --silent "https://api.github.com/repos/argoproj/argo-cd/releases/latest" | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/') && \
    curl -sSL -o /opt/argocd/argocd https://github.com/argoproj/argo-cd/releases/download/$VERSION/argocd-linux-amd64 && \
    ln -s $PWD/argocd /usr/local/bin/ && \
    chmod +x /opt/argocd/argocd

ADD ./launcher.sh /launcher.sh
RUN chmod a+x /launcher.sh

RUN mkdir /workdir
WORKDIR /workdir

VOLUME /root/.kube
VOLUME /workdir

ENTRYPOINT [ "/launcher.sh" ]

