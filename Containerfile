FROM registry.access.redhat.com/ubi8-minimal

# first row tools needed in container
# second row for undeclared deps of tools -- rsync reqd for oc rsync cmd
RUN microdnf install -y tar gzip \ 
    rsync && \ 
    microdnf clean all

RUN mkdir /opt/openshift && \
    cd /opt/openshift && \
    curl -L -O https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/oc/4.4/linux/oc.tar.gz && \
    tar -xf oc.tar.gz && \
    rm oc.tar.gz

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

