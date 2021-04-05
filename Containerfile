FROM registry.access.redhat.com/ubi8-minimal

# first row tools needed in container
# second row for undeclared deps of tools -- rsync reqd for oc rsync cmd
RUN microdnf install -y tar gzip bzip2 \ 
    rsync findutils git && \ 
    microdnf clean all

ADD collect-all.sh /
ADD command-collectors /command-collectors
RUN /collect-all.sh "/command-collectors"

ADD ./launcher.sh /launcher.sh
RUN chmod a+x /launcher.sh

RUN mkdir /workdir
WORKDIR /workdir

VOLUME /root/.kube
VOLUME /workdir

ENTRYPOINT [ "/launcher.sh" ]

