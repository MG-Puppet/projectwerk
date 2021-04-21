class w32time::service {

  service { 'w32time':
    ensure => running,
    enable => true,
  }

}
