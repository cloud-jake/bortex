#!/bin/bash

source variables.inc
#PROJECT
#ZONE
#SUBNET_NAME

SERVER=oracle-test

gcloud compute instances create ${SERVER} \
  --project=${PROJECT} \
  --zone=${ZONE} \
  --machine-type=e2-highmem-2 \
  --network-interface=network-tier=PREMIUM,subnet=${SUBNET_NAME} \
  --maintenance-policy=MIGRATE \
  --provisioning-model=STANDARD \
  --service-account=$(gcloud projects describe $PROJECT --format="value(projectNumber)")-compute@developer.gserviceaccount.com \
  --scopes=https://www.googleapis.com/auth/cloud-platform \
  --create-disk=auto-delete=yes,boot=yes,device-name=${SERVER},image=projects/centos-cloud/global/images/centos-7-v20220822,mode=rw,size=200,type=projects/${PROJECT}/zones/${ZONE}/diskTypes/pd-balanced \
  --no-shielded-secure-boot \
  --shielded-vtpm \
  --shielded-integrity-monitoring \
  --reservation-affinity=any



