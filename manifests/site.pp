node 'srv19-dc1.mitchell.test' {
   include chocolatey
   #include profile::windows_firewall
   include profile::ntp_server
   include ssh
   include motd
}

node 'w10-puppet' {
  include chocolatey
  include w32time
  #include profile::windows_firewall
  include ssh
  include motd
}

node 'centos-agent.mitchell.test' {
  include motd
  include nftables  
  include ssh
  include profile::ntp_client
}

node 'ubnt-agent.mitchell.test' {
  class { 'motd':
    dynamic_motd => false,
  }
  include nftables
  include ssh
  include profile::ntp_server
}
