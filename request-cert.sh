#!/bin/bash -e

ROLE_NAME=vault
DOMAIN_NAME=vault

./vault write -format=json pki/issue/$ROLE_NAME common_name=$DOMAIN_NAME \
  | jq -r .data.private_key,.data.certificate,.data.issuing_ca > $DOMAIN_NAME.pem
