IoT on GCP showcase

# tech stack  
frameworks logos: beam, terraform  
cloud logos: iot core  

# architecture

<iframe width="700" height="400" style="border:none;" src="https://arcentry.com/app/embed.html?id=e8459f4e-6189-4968-9b06-c24e25840170"></iframe>

# spin up

terraform command

# tear down

terraform command

# walkthrough
1. create pubsub topic `telemetry`
2. assign pubsub publisher role to `cloud-iot@system.gserviceaccount.com` 
3. create vm 
4. update and init gcloud sdk on vm (don't use vm sa for auth)
5. install dependencies on vm
6. create iot registry
7. create cryptographical key on vm
8. register devices in iot registry
9. create bigquery table iot.telemetry
10. creat gcs bucket for dataflow staging seva-playground-dataflow-staging
10. create dataflow job
7. run devices
git clone https://gitlab.com/vsevolod.hrechaniuk/iot-on-gcp
re-generate jwt token if you are getting auth failures
to run in background append `> foo.log &`

NB: for commands, values etc. see terraform script

test