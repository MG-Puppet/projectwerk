class profile::apache (
){
  # Install Apache Without Default Vhost
  class { 'apache':
    default_vhost => false,
  }
  # Add WebTraffic Rule to nftables
  nftables::rule{ 'WebTraffic_IN':
    rule => "add element inet filter IN_TCP_DPORT { 80, 443 }",
  }
  #Finds all vhosts defined in Hiera and add them to the variable
  $included_vhosts = lookup( { 'name'  => 'apache::vhost',
                       'merge' => {
                       'strategy'        => 'deep',
                       'knockout_prefix'  => '--',
                     },
                     'default_value' => {}
  })
  # Create all vhosts found in the variable if it is not empty
  if $included_vhosts != undef {
    create_resources('apache::vhost', $included_vhosts)
  }
}
