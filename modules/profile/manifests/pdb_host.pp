class profile::pdb_host {
  
  $postgres_host = 'ubnt-agent.mitchell.test'
  
  class { 'puppetdb::database::postgresql':
    listen_addresses => $postgres_host,
  }
  
  class { 'puppetdb::server':
    database_host => $postgres_host,
  }

}
