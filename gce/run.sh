#!/bin/bash


echo 'creating device' $1
gcloud beta iot devices create $1 \
  --project=$PROJECT_ID \
  --region=$REGION \
  --registry=simulation \
  --public-key path=rsa_cert.pem,type=rs256
echo 'sending signals' $2
python mqtt.py \
   --project_id=$PROJECT_ID \
   --cloud_region=$REGION \
   --registry_id=simulation \
   --device_id=$1 \
   --private_key_file=rsa_private.pem \
   --message_type=event \
   --num_messages=$2 \
   --algorithm=RS256
   














"""
sudo apt-get remove google-cloud-sdk -y
curl https://sdk.cloud.google.com | bash
gcloud init
gcloud components update
gcloud components install beta

export PROJECT_ID=$(gcloud config get-value project)
export REGION="us-central1"
sudo apt-get update
sudo apt-get install python-pip openssl git -y
sudo pip install pyjwt paho-mqtt cryptography
git clone https://gitlab.com/vgoslo/iot-on-gcp
cd iot-on-gcp
openssl req -x509 -newkey rsa:2048 -keyout rsa_private.pem -nodes -out rsa_cert.pem -subj "/CN=unused"


---


gcloud iot registries credentials create \
    --path=rsa_cert.pem \
    --project=$PROJECT_ID \ 
    --registry=simulation \
    --region=$REGION


wget https://pki.google.com/roots.pem

gcloud beta iot devices create alpha \
  --project=$PROJECT_ID \
  --region=$REGION \
  --registry=registry \
  --public-key path=rsa_cert.pem,type=rs256


python mqtt.py \
   --project_id=$PROJECT_ID \
   --cloud_region=$REGION \
   --registry_id=registry \
   --device_id=alpha \
   --private_key_file=rsa_private.pem \
   --message_type=event \
   --algorithm=RS256

   """