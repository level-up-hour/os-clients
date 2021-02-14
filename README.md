# os-clients

A collection of OpenShift and Kubernetes clients delivered as a container

If you want to just use the container, you can find it auto-building on [quay.io](https://quay.io).

```bash
docker pull quay.io/tluh/os-clients
```

or

```bash
podman pull quay.io/tluh/os-clients
```

We recommend you setup aliases like in [usage-aliases](./usage-aliases).

```bash
alias oc='podman run --rm -it -v ~/.kube:/root/.kube:z -v $PWD:/workdir:z os-clients:4.4 oc'
alias odo='podman run --rm -it -v ~/.kube:/root/.kube:z -v $PWD:/workdir:z os-clients:4.4 odo'
alias kubectl='podman run --rm -it -v ~/.kube:/root/.kube:z -v $PWD:/workdir:z os-clients:4.4 kubectl'
```

If you find yourself switching between cluster admin and less privileged accounts, we also suggest doing something like (example from linux):

```bash
mkdir -p ~/.config/kube-configs/devel
alias oc-devel='podman run --rm -it -v ~/.config/kube-configs/devel:/root/.kube:z -v $PWD:/workdir:z os-clients:4.4 oc'
mkdir -p ~/.config/kube-configs/admin
alias oc-admin='podman run --rm -it -v ~/.config/kube-configs/admin:/root/.kube:z -v $PWD:/workdir:z os-clients:4.4 oc'
```
