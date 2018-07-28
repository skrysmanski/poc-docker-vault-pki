#!/bin/bash -e

ROLE_NAME=vault
DOMAIN_NAME=$(hostname)

CERT_DATA=$(./vault write -format=json pki/issue/$ROLE_NAME common_name=$DOMAIN_NAME)

mkdir -p certs
echo $CERT_DATA | jq -r .data.certificate,.data.issuing_ca > certs/vault.crt
echo $CERT_DATA | jq -r .data.private_key > certs/vault.key
