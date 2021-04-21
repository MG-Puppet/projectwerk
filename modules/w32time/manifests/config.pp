class w32time::config {
  
  registry_value {'HKLM\System\CurrentControlSet\Services\W32Time\Parameters\Type':
    ensure => present,
    type   => string,
    data   => "${w32time::sync_type}",
  }

  registry_value {'HKLM\System\CurrentControlSet\Services\W32Time\Parameters\NtpServer':
    ensure => present,
    type   => string,
    data   => "${w32time::ntp_servers}",
  }
  if ($w32time::ntp_server == true) {
    registry_value {'HKLM\System\CurrentControlSet\Services\W32Time\Config\AnnounceFlags':
      ensure => present,
      type   => dword,
      data   => '5',
    }
    registry_value {'HKLM\System\CurrentControlSet\Services\W32Time\TimeProviders\NtpServer\Enabled':
      ensure => present,
      type   => dword,
      data   => '1',
    }
  }
  else {
    registry_value {'HKLM\System\CurrentControlSet\Services\W32Time\Config\AnnounceFlags':
      ensure => present,
      type   => dword,
      data   => '10',
    }
    registry_value {'HKLM\System\CurrentControlSet\Services\W32Time\TimeProviders\NtpServer\Enabled':
      ensure => present,
      type   => dword,
      data   => '0',
    }
  }
}

