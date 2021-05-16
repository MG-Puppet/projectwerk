class profile::pdb-master {

$puppetdb_host = 'ubnt-agent.mitchell.test'

  class { 'puppetdb::master::config':
    puppetdb_server => $puppetdb_host,
  }

}
