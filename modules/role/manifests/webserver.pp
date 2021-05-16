class role::webserver {

  if $facts['kernel'] == 'Linux' {
    include profile::security_baseline
    include profile::ntp_client
    include profile::apache 
  }
  elsif $facts['kernel'] == 'windows' {
    include profile::security_baseline
    include profile::windows_firewall
    include profile::ntp_client
    include profile::iis
  }
  else {
    notify { "This kernel is not supported in the webserver role":}
  }

}
