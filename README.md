IoT telemetry streaming ingest, warehouse & reporting on GCP.

# architecture

[Interactive](https://arcentry.com/app/embed.html?id=d16af169-924f-4cc6-8e05-d47ff49298b9&key=762f473ebf01b9181b61ff4dd041132d&live=true&camera=0_13.3518_8.08_-0.7854_0.6155_0.5236_343.8186_450_370.2461&hideViewControls=0)

![alt text](assets/architecture.png "Architecture diagram")

# pre-requisites
- cloud sdk  
`brew cask install google-cloud-sdk` \
`gcloud init` \
`gcloud components update` \
`gcloud auth application-default login`
- terraform  
`brew install terraform`
- ssh key paired with your gitlab account
- codebase  
`git clone git@gitlab.com:vgoslo/iot-on-gcp` \
`cd iot-on-gcp`
- beam sdk  
`cd beam` \
`virtualenv env` \
`source env/bin/activate` \
`pip install 'apache-beam[gcp]'`

# spin up

1. create sa key `sa.json` and place it in root folder.  
`export GOOGLE_APPLICATION_CREDENTIALS=sa.json`

2. initialize terraform  
`cd ..` \
`terraform init`

3. verify you are all set  
`terraform plan`

4. create cloud infra  
`terraform apply`

# infrastructure walkthrough
-1. create pubsub topic `telemetry`
-2. assign pubsub publisher role to `cloud-iot@system.gserviceaccount.com` 
3. create vm 
4. update and init gcloud sdk on vm (don't use vm sa for auth)
5. install dependencies on vm
-6. create iot registry
7. create cryptographical key on vm
8. register devices in iot registry
-9. create bigquery table iot.telemetry
-10. creat gcs bucket for dataflow staging seva-playground-dataflow-staging
10. create dataflow job
7. run devices
git clone https://gitlab.com/vgoslo/iot-on-gcp
re-generate jwt token if you are getting auth failures. i've set expiration to 60days.
to run in background append `> foo.log &`

NB: for commands, values etc. see terraform script

# result

signal emission: readings are published 2 per second (every 500ms). state is published every 5 seconds
windowing strategy: sliding window with size 10 sec and frequency 5 sec. so, every 5 seconds we are getting a 10-second average reading
//note on timestamp: we are storing RFC3339 timestamp of processing time. additionally, emission timestamp could also be stored, which is 
//////contained in device msg

# tear down

1. destroy cloud infra 
`terraform destroy`

2. delete data studio reports

