### KIND (Kubernetes in Docker) Install

curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.18.0/kind-linux-amd64

chmod +x ./kind

sudo mv ./kind /usr/local/bin/kind

### KIND Cluster initialisieren

kind create cluster -n istio-lab

### Istio install

curl -L https://istio.io/downloadIstio | sh -

cd istio-1.25.2 

sudo mv ./istioctl /usr/local/bin/

istioctl install --set profile=default -y

## Istio apply addons
cd samples

kubectl apply -f ./addons

kubectl label namespace default istio-injection=enabled
 
