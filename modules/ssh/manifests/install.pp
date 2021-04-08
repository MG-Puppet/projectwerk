class ssh::install {
  
  if $facts['kernel'] == 'Linux' {
    package {"${ssh::pkg_name}":
      ensure   => present,
      provider => "${ssh::provider}",
    }
  }
  elsif $facts['kernel'] == 'windows' {
    package {"${ssh::pkg_name}":
      ensure          => present,
      provider        => "${ssh::provider}",
      install_options => ['-params','"','/SSHServerFeature','/KeyBasedAuthenticationFeature','"'],
    }
  }
  else {
    notify {"This Kernel is not supported in the SSH Module":}
  }   

}
