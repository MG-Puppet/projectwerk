class profile::security_baseline {
    if $facts['kernel'] == 'Linux' {
      # Include MOTD Class, Disable Dynamic MOTD if OS = Debian
      if $facts['os']['family'] == 'Debian' {
        class { 'motd':
          dynamic_motd => false,
        }
      }
      else {
        include motd
      }
      # Include Host Firewall & SSH
      include nftables
      include ssh
    }   
    elsif $facts['kernel'] == 'windows' {
      include chocolatey
      include ssh
      include motd
    }
    else {
      notify {'The Security Baseline profile is not supported on this Kernel':}
    }
}  

