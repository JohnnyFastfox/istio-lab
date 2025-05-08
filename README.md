### KIND (Kubernetes in Docker) Install

curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.18.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

### KIND Cluster initialisieren

kind create cluster istio-lab

### Istio install

curl -L https://istio.io/downloadIstio | sh -
cd istio-1.25.2 
export PATH=$PWD/bin:$PATH

istioctl install --set profile=default -y

## Istio apply addons
cd samples
kubectl apply -f ./addons

istioctl label namespace default istio-injection=enabled
 
