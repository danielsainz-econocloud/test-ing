#!/bin/bash

 NAMESPACE="web-pro"

#kubectl rollout restart deployments/jbossmkt -n services-pro
#sleep 120

kubectl rollout restart deployments/rsyslog-server -n monitoring
kubectl rollout restart deployments/rsyslog-apache-server -n monitoring 
sleep 60

 DEPLOYMENTS=`kubectl get deployments -n $NAMESPACE |  tail -n +2 | cut -d ' ' -f 1 `
 for DEPLOY in $DEPLOYMENTS; do
   kubectl rollout restart deployments/$DEPLOY -n $NAMESPACE
   sleep 5
 done

 NAMESPACE="web-pre"

 DEPLOYMENTS=`kubectl get deployments -n $NAMESPACE |  tail -n +2 | cut -d ' ' -f 1 `
 for DEPLOY in $DEPLOYMENTS; do
   kubectl rollout restart deployments/$DEPLOY -n $NAMESPACE
   sleep 5
 done
