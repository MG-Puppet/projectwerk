class w32time (
  Boolean $ntp_server = false,
  String $sync_type = $facts['windows_time_type'],
  String $ntp_servers = "0.be.pool.ntp.org,0x9 1.be.pool.ntp.org,0x9",
) {

  contain w32time::install
  contain w32time::config
  contain w32time::service

  Class['::w32time::install']
  -> Class['::w32time::config']
  ~> Class['::w32time::service']
}

