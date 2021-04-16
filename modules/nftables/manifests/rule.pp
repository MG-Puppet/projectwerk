define nftables::rule (
  String $rule,
) {
  file { "/etc/nftables/puppet/${name}_puppet.nft":
    ensure  => present,
    content => "#!/usr/sbin/nft -f \r\n${rule} ",
    notify  => Service['nftables'],
  }
}
