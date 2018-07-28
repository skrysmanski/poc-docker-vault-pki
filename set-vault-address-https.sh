#!/bin/bash -e

# NOTE: This file must be sourced:
#
# $ . ./set-vault-address-https.sh
#

export VAULT_ADDR=https://$(hostname):8200
