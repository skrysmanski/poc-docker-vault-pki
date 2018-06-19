listener "tcp" {
  address = "0.0.0.0:8202"
  tls_disable = "true"
}

storage "file" {
    path = "/vault/file"
}
