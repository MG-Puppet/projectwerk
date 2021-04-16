class ssh::config {

  file { "${ssh::config_path}":
    ensure => present,
    source => "${ssh::config_source}",
  }

  file { "${ssh::legalnotice_path}":
    ensure => present, 
    source => "${ssh::legalnotice_source}",
  }

  #nftables::rule { 'ISAKMP':
   # rule => "add element inet filter IN_TCP_DPORT { 500 }",
  #}

}
