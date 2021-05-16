node 'srv19-dc1.mitchell.test' {
   include profile::security_baseline
   include profile::windows_firewall
   include profile::ntp_server
}

node 'ubnt-pps.mitchell.test' {
  include profile::puppet_server_base
  include profile::ntp_server
}

node 'centos-agent.mitchell.test' {
  include role::webserver
}

node 'ubnt-agent.mitchell.test' {
  include role::webserver
}

node 'webserver.mitchell.test' {
  include role::webserver
}
