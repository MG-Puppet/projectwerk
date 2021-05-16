class profile::puppetdb {

  # Open ports ingress traffic for PuppetDB, PostgreSQL, Jetty
  nftables::rule{'puppetDB':
    rule => "add element inet filter IN_TCP_DPORT { 8081, 5432, 8080 }",
  }
  # Install puppetDB + PostgreSQL
  class { 'puppetdb': }
  # Configure the Puppet server to use puppetdb
  class { 'puppetdb::master::config': }



}
