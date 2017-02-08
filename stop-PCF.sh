#!/bin/bash

# CHANGE-ME
export BOSH_CLIENT=client
# CHANGE-ME
export BOSH_CLIENT_SECRET=secret

bosh() {
  BUNDLE_GEMFILE=/home/tempest-web/tempest/web/vendor/bosh/Gemfile bundle exec bosh $@
}

# CHANGE-ME
bosh -n --ca-cert /var/tempest/workspaces/default/root_ca_certificate target https://10.0.0.10

# CHANGE-ME
bosh -n -d /var/tempest/workspaces/default/deployments/cf-05e71b49a4a7a03a4b91.yml stop --hard
