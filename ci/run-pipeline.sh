#!/bin/sh
set -o allexport
source variables.txt
set +o allexport
#brew install gettext
alias envsubst='/usr/local/Cellar/gettext/*/bin/envsubst'

# MAKE SERVICE ACCOUNT KEY 1 LINE FOR EASIER 
GCP_SERVICE_ACCOUNT_KEY=$(tr -d '\n' < $GCP_SERVICE_ACCOUNT_KEY_PATH)

envsubst < params.yml.template > params.yml


./scripts/concourse-start.sh

fly -t pks login -c http://127.0.0.1:8080 -u concourse -p password
fly -t pks sync
fly -t pks set-pipeline -p deploy-pks -c pipeline.yml -l params.yml -n
#fly -t pks unpause-pipeline -p deploy-pks
#fly -t pks trigger-job -j deploy-pks/bootstrap-terraform-state
