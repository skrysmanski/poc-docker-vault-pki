#!/bin/bash -e

curl http://127.0.0.1:8200/v1/pki/ca/pem -o root-ca.pem
