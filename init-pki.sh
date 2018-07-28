#!/bin/bash -e

./vault secrets enable pki

./vault write pki/root/generate/internal \
    common_name="Intranet CA"

./vault write pki/config/urls \
    issuing_certificates="http://127.0.0.1:8202/v1/pki/ca" \
    crl_distribution_points="http://127.0.0.1:8202/v1/pki/crl"

./vault write pki/roles/vault \
    allowed_domains=$(hostname) \
    allow_bare_domains=true \
    allow_subdomains=false \
    max_ttl=72h

./get-root-ca-cert.sh
