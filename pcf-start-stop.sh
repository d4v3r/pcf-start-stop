#!/bin/bash

# CHANGE-ME
export BOSH_CLIENT=client
export BOSH_CLIENT_SECRET=secret
BOSH_DEPLOYMENT_NAME="cf-05e71b49a4a7a03a4b91"
BOSH_TARGET_URI="https://10.0.0.10"

bosh() {
  BUNDLE_GEMFILE=/home/tempest-web/tempest/web/vendor/bosh/Gemfile bundle exec bosh $@
}

bosh_args=""
case $1 in
  start)
    bosh_args="start"
    ;;
  stop)
    bosh_args="stop --hard"
    ;;
  *)
    echo "Usage: $0 <start|stop>"
    exit 1
    ;;
esac

bosh -n --ca-cert /var/tempest/workspaces/default/root_ca_certificate target $BOSH_TARGET_URI
bosh -n -d /var/tempest/workspaces/default/deployments/$BOSH_DEPLOYMENT_NAME.yml $bosh_args

