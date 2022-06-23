#!/bin/sh

# Listanje pod-ova u klasteru
kubectl get nodes
# Kubegres operator instalacija
kubectl apply -f https://raw.githubusercontent.com/reactive-tech/kubegres/v1.15/kubegres.yaml
# Provera volumena
kubectl get sc
# Primene .yaml fajlova
kubectl apply -f postgres-secret.yaml
kubectl apply -f postgres.yaml
# Pokretanje podova
kubectl get pods -o wide -w
# Pregled podova
kubectl get pod,statefulset,svc,configmap,pv,pvc -o wide
# Master pod
kubectl get pods --selector replicationRole=primary
# Slave pod-ovi
kubectl get pods --selector replicationRole=replica
# Brisanje master pod-a
kubectl delete pod mypostgres-1-0


