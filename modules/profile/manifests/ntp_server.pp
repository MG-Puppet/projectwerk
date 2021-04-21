class profile::ntp_server {
    if $facts['kernel'] == 'Linux' {
      class { 'ntp':
        servers        => [ '0.be.pool.ntp.org','1.be.pool.ntp.org', '2.be.pool.ntp.org'],
        restrict       => ['127.0.0.1','192.168.153.0 mask 255.255.255.0 nomodify notrap'],
        service_enable => true,
      }

      nftables::rule{ 'NTP_OUT':
        rule => "add element inet filter OUT_UDP_DPORT { 123 }",
      }
      nftables::rule{ 'NTP_IN':
        rule => "add element inet filter IN_UDP_DPORT { 123 }",
      }
    }
    elsif $facts['kernel'] == 'windows' {
      class {'w32time':
        ntp_server    => true,
        sync_type     => 'NTP',
      }
    }
    else {
      notify {'This kernel is not supported as NTP_Server':}
    }
}
