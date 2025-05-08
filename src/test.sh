#!/bin/bash

set -e

KIND_IP=$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' istio-lab-control-plane)

PORT=$(kubectl -n istio-system get svc istio-ingressgateway \
  -o jsonpath='{.spec.ports[?(@.port==80)].nodePort}')

echo "Sende 100 Anfragen an http://${KIND_IP}:${PORT}/"
echo "Antwortverteilung nach Versionen:"

for i in {1..1000}; do
  curl -s -H "Host: httpbin.example" http://${KIND_IP}:${PORT}/ | jq -r '.message'
done | sort | uniq -c

echo "Test abgeschlossen."
