#!/bin/bash

# Create Basition Host
# https://cloud.google.com/kubernetes-engine/docs/tutorials/private-cluster-bastion

source variables.inc

#PROJECT
#REGION
#ZONE
#SUBNET_NAME
#DATASTREAM_SOURCE


INSTANCE_NAME=oracle-bastion

# Create Bastion Host for Oracle
gcloud compute --project=${PROJECT} instances create $INSTANCE_NAME \
    --zone=$ZONE \
    --machine-type=e2-micro \
    --network-interface=network-tier=PREMIUM,subnet=$SUBNET_NAME \
    --no-service-account --no-scopes --tags=bastion1521 

# Allow Datastream IPs to Bastion Host for Oracle
gcloud compute --project=${PROJECT} firewall-rules create bastion-ssh \
     --direction=INGRESS --priority=1000 --network=$SUBNET_NAME \
     --action=ALLOW --rules=tcp:22 \
     --source-ranges=${DATASTREAM_SOURCE} --target-tags=bastion1521 

# Allow access from Bastion Host for Oracle to Oracle Server
gcloud compute --project=${PROJECT} firewall-rules create bastion-fwd \
     --direction=INGRESS --priority=1000 --network=$SUBNET_NAME \
     --action=ALLOW --rules=tcp:1521 \
     --source-tags=bastion1521 --target-tags=oracle1521
