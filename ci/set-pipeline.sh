#!/bin/sh
set -a
source variables.txt 
set +a
brew install gettext
alias envsubst='/usr/local/Cellar/gettext/*/bin/envsubst'
envsubst < params.yml.blank > params.yml

fly -t pks set-pipeline -p new-pks -c pipeline.yml -l params.yml -n
