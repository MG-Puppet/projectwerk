node 'srv19-dc1.mitchell.test' {
   include profile::security_baseline
   include profile::windows_firewall
   include profile::ntp_server
}

node 'ubnt-pps.mitchell.test' {
  include profile::puppet_server_base
  include profile::ntp_server
}

node 'w10-puppet' {
  include profile::security_baseline
  include profile::windows_firewall
  include profile::ntp_client
}

node 'centos-agent.mitchell.test' {
  include profile::security_baseline
  include profile::ntp_client
  include profile::apache
}

node 'ubnt-agent.mitchell.test' {
  include profile::security_baseline
  include profile::ntp_client
  include profile::apache
}
