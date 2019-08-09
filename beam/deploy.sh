#!/bin/bash

#python -m telemetry_etl \
#    --runner DataflowRunner \
#    --project seva-sandbox \
#    --staging_location gs://seva-playground-dataflow-staging/bin \
#    --temp_location gs://seva-playground-dataflow-staging/tmp \
#    --template_location gs://seva-playground-dataflow-staging/templates/telemetry_etl

#--region us-central1 \


python -m telemetry_etl \
--project seva-playground \
--region us-central1 \
--zone us-central1-a \
--stream projects/seva-playground/topics/telemetry \
--sink iot.telemetry \
--temp_location gs://seva-playground-dataflow-staging/tmp \
--setup_file ./setup.py \
--runner DataflowRunner
