class nftables::service {

  service { "${nftables::native_fw}":
    ensure  => stopped,
    enable  => false, 
  }

  service { "${nftables::service_name}":
    ensure  => running,
    enable  => true, 
  }

}
