FROM registry.access.redhat.com/ubi8-minimal

RUN microdnf install -y tar gzip bzip2 && \
    microdnf clean all

RUN mkdir /opt/helm && \
    cd /opt/helm && \
    curl -L -O https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/helm/latest/helm-linux-amd64.tar.gz && \
    tar -xf helm-linux-amd64.tar.gz && \
    rm helm-linux-amd64.tar.gz

RUN mkdir /opt/openshift && \
    cd /opt/openshift && \
    curl -L -O https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/oc/latest/linux/oc.tar.gz && \
    tar -xf oc.tar.gz && \
    rm oc.tar.gz

RUN mkdir /opt/template2helm && \
    cd /opt/template2helm && \
    curl -L -O https://github.com/redhat-cop/template2helm/releases/download/v0.1.0/linux-amd64-template2helm.bz2 && \
    bunzip2 linux-amd64-template2helm.bz2 && \
    chmod a+x linux-amd64-template2helm

RUN mkdir /opt/odo && \
    cd /opt/odo && \
    curl -L -O https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/odo/latest/odo-linux-amd64.tar.gz && \
    tar -xf odo-linux-amd64.tar.gz && \
    rm odo-linux-amd64.tar.gz

ADD ./launcher.sh /launcher.sh
RUN chmod a+x /launcher.sh

RUN mkdir /workdir
WORKDIR /workdir

VOLUME /root/.kube
VOLUME /workdir

ENTRYPOINT [ "/launcher.sh" ]

