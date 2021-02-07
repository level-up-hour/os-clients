FROM fedora-minimal

RUN microdnf install -y tar gzip bzip2 && \
    microdnf clean all

RUN mkdir /opt/helm
RUN cd /opt/helm && \
    curl -L -O https://get.helm.sh/helm-v3.5.0-linux-amd64.tar.gz && \
    tar -xf helm-v3.5.0-linux-amd64.tar.gz && \
    mv linux-amd64/* ./

RUN mkdir /opt/openshift
ADD ./oc /opt/openshift/oc

RUN mkdir /opt/template2helm
RUN cd /opt/template2helm && \
    curl -L -O https://github.com/redhat-cop/template2helm/releases/download/v0.1.0/linux-amd64-template2helm.bz2 && \
    bunzip2 linux-amd64-template2helm.bz2 && \
    chmod a+x linux-amd64-template2helm


ADD ./launcher.sh /launcher.sh
RUN chmod a+x /launcher.sh

RUN mkdir /workdir
WORKDIR /workdir

VOLUME /root/.kube
VOLUME /workdir

ENTRYPOINT [ "/launcher.sh" ]

