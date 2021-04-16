class nftables::install {

  package { "${nftables::pkg_name}":
    ensure   => present,
  } 

}
