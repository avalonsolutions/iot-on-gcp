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
