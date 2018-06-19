#!/bin/bash -e

ROLE_NAME=vault
DOMAIN_NAME=vault

CERT_DATA=$(./vault write -format=json pki/issue/$ROLE_NAME common_name=$DOMAIN_NAME)

echo $CERT_DATA | jq -r .data.certificate,.data.issuing_ca > config/vault.crt
echo $CERT_DATA | jq -r .data.private_key > config/vault.key
