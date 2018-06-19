listener "tcp" {
  address = "0.0.0.0:8200"
  tls_cert_file = "/vault/config/vault.crt"
  tls_key_file  = "/vault/config/vault.key"
}

listener "tcp" {
  address = "0.0.0.0:8202"
  tls_disable = "true"
}

storage "file" {
    path = "/vault/file"
}
