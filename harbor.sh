helm repo add harbor https://helm.goharbor.io
helm repo update

if [ $# -eq 1 ]; then
    VERSION=$1
    helm fetch harbor/harbor --untar --version ${VERSION}
else
    helm fetch harbor/harbor --untar 
fi

helm install harbor ./harbor \
    --namespace=harbor \
    --create-namespace