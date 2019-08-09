#!/bin/bash


cd iot-on-gcp/gce
export PROJECT_ID=$(gcloud config get-value project)
export REGION="us-central1"
echo 'creating registry'
gcloud beta iot registries create simulation \
   --project=$PROJECT_ID \
   --region=us-central1 \
   --event-notification-config=topic=projects/$PROJECT_ID/topics/telemetry
echo 'handling auth'
openssl req -x509 -newkey rsa:2048 -keyout rsa_private.pem -nodes -out rsa_cert.pem -subj "/CN=unused"
wget https://pki.google.com/roots.pem
echo 'done'
