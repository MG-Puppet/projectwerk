class ssh::service {

  service { "${ssh::service_name}":
    ensure  => running,
    enable  => true,
  }

}
