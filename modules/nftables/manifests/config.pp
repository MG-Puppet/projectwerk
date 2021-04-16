class nftables::config {
  # Ensures the needed directory structure is present
  $nftables::config_dirs.each | String $config_dir | {
    file { "${config_dir}":
      ensure  => directory,
    }
  }
  # Ensures the config file is present
  file { "${nftables::config_file}":
    ensure => present,
    source => "${nftables::config_source}", 
  }
  if $facts['os']['family'] == 'RedHat' {
    file { "${nftables::inet_filter_file}":
      ensure => present,
      source => "${nftables::inet_filter_source}",
    }
  }

}
