class profile::puppet_server_base {
  # Include MOTD
  class { 'motd':
    dynamic_motd => false,
  }
  # Include host firewall 'nftables'
  include nftables
  # Allow incoming Catalog Requests
  nftables::rule{ 'Catalog_Request':
    rule => "add element inet filter IN_TCP_DPORT { 8140 }",
  }
  # Include SSH Module
  include ssh
}
  
  
