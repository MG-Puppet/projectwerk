class ssh::config {

  file { "${ssh::config_path}":
    ensure => present,
    source => "${ssh::config_source}",
  }

}
