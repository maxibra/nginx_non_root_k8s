# nginx_non_root_k8s
Docker image to run non-root nginx in k8s cluster
The process is tested on Elementary OS (Ubuntu) with minikube

# Requirements
-Docker: (https://docs.docker.com/engine/install/)
- minikube: (https://minikube.sigs.k8s.io/docs/start/)
- Node.js: (https://nodejs.org/en/download/package-manager/)

# Code clone/pull
```
git clone https://github.com/maxibra/nginx_non_root_k8s.git
git clone git@github.com:maxibra/nginx_non_root_k8s.git
```

# Image build
Change directory 
```
cd nginx_non_root_k8s/src
docker build . -t maxib/nginx_non_root
docker push maxib/nginx_non_root:latest
```

# K8S cluster
```
minikube start
kubectl apply -f https://github.com/maxibra/nginx_non_root_k8s/releases/download/v0.1/deploy.yaml
kubectl expose deployment nginx-deployment --port=80 --target-port=8080
```

# test

```
./test.sh
```

