# Vault Docker PKI Proof-of-Concept
This repository contains a proof-of-concept on how to get a Vault container running on HTTPS where the SSL cert is created and signed by [Vault's PKI engine](https://www.vaultproject.io/docs/secrets/pki/index.html).

This proof-of-concept keeps vault's data in the `data` directory (will be created automatically). So, if you want to start over again, just delete the `data` directory.

This proof-of-concept uses the [official vault image](https://hub.docker.com/_/vault/).

## Required Software
This proof-of-concept currently requires either Linux or macOS.

You need to have the following installed:

* docker (obviously)
* [docker-compose](https://github.com/docker/compose/releases)
* jq
* curl

Furthermore, you need to download the vault binary into *this* directory. You can find it here:

https://www.vaultproject.io/downloads.html

This proof-of-concept has been tested with version 0.10.4.


## Creating vault
You need to call the scripts in this folder in the following order:

1. `docker-compose -f docker-compose.pre-tls.yml up` (brings up a vault instance that communicates over HTTP rather than HTTPS)
1. `. ./set-vault-address-http.sh`  (note the leading `.`)
1. `./init-vault.sh`
1. Save/Keep/Write down both the **Unseal Key 1** as well as the **Initial Root Token**.
1. `./unseal-vault.sh` (requires unseal key)
1. `./login-vault.sh` (requires root token)
1. `./init-pki.sh` (this will also download the CA pubkey as `root-ca.pem` into the current directory)
1. `./request-cert-for-vault.sh` (this will create a certificate for vault and put it in the `certs` directory)
1. `docker-compose -f docker-compose.pre-tls.yml down`

This completes the initialization.

You can now bring up the TLS-protected vault via:

    docker-compose up

You need to switch your vault session to HTTPS:

    . ./set-vault-address-https.sh

And then you need to unseal the vault again:

    ./unseal-vault.sh

Now the vault works.

When you're done, shut down the vault with:

    docker-compose down
