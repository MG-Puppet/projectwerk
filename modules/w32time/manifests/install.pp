class w32time::install {

  if $facts['kernel'] == 'windows' {
    registry_key { 'HKLM\System\CurrentControlSet\Services\W32Time\Parameters\Type':
      ensure => present,
    }
    registry_key { 'HKLM\System\CurrentControlSet\Services\W32Time\Parameters\NtpServer':
      ensure => present,
    }
    registry_key { 'HKLM\System\CurrentControlSet\Services\W32Time\Config\AnnounceFlags':
      ensure => present,
    }
    registry_key { 'HKLM\System\CurrentControlSet\Services\W32Time\TimeProviders\NtpServer\Enabled':
      ensure => present,
    }
  }
}
