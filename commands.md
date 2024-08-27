# Kubernetes Commands

## Create a namespace in kubernetes

kubectl create namespace flask-app-namespace

## Create a kubernetes docker pull secret

You can create a Docker pull secret using the kubectl command-line tool. The command usually looks like this:
kubectl create secret docker-registry my-pull-secret \
 --docker-username=YOUR-USERNAME \
 --docker-password=YOUR-PASSWORD \
 --docker-email=YOUR-EMAIL \
 --docker-server=YOUR-REGISTRY-SERVER

### our command

kubectl create secret docker-registry ghcr-secret --docker-server=ghcr.io --docker-username=$GH_USERNAME --docker-password=$GH_TOKEN -n flask-app-namespace

## To run a environment

helm upgrade --install flask-app-{{environmenet here}} $LABROOT/flask-app-chart/ -f $LABROOT/flask-app-chart/values-{{environement here}}.yaml --namespace flask-app-namespace

## check the pods

kubectl get pods -n flask-app-namespace

## port forward to local

kubectl get svc -n flask-app-namespace
kubectl port-forward svc/flask-app-prod 8080:80 -n flask-app-namespace
kubectl port-forward svc/flask-app-prod 3000:80 -n flask-app-namespace --address 0.0.0.0

## clean ressources

helm uninstall flask-app-prod --namespace flask-app-namespace
helm uninstall flask-app-dev --namespace flask-app-namespace
kubectl delete namespace flask-app-namespace
