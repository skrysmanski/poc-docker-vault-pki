listener "tcp" {
  address = "0.0.0.0:8200"
  tls_disable = "true"
}

listener "tcp" {
  address = "0.0.0.0:8202"
  tls_disable = "false"
  tls_cert_file = "/vault/config/vault.crt"
  tls_key_file  = "/vault/config/vault.key"
}

storage "file" {
    path = "/vault/file"
}
