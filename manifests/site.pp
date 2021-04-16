node 'srv19-dc1.mitchell.test' {
   include chocolatey
   include ssh
   include motd
}

node 'w10-puppet' {
  include chocolatey  
  include ssh
  include motd
}

node 'centos-agent.mitchell.test' {
  include motd
  include nftables  
  include ssh
}

node 'ubnt-agent.mitchell.test' {
  class { 'motd':
    dynamic_motd => false,
  }
  include nftables
  include ssh
}
