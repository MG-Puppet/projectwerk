class profile::ntp_client {
    if $facts['kernel'] == 'Linux' {
      class { 'ntp':
        servers        => ['192.168.153.180', '192.168.153.210'],
        restrict       => ['127.0.0.1'],
        service_enable => true,
      }
      nftables::rule{ 'NTP_OUT':
        rule => "add element inet filter OUT_UDP_DPORT { 123 }",
      }
    }
    elsif $facts['kernel'] == 'windows' {
      include w32time
    }
    else {
      notify {'This kernel is not supported as NTP Client':}
    }
}
