class nftables (
  String $pkg_name,
  String $service_name,
  Array $config_dirs,
  String $config_file,
  String $config_source,
  String $native_fw,
) {

  contain nftables::install
  contain nftables::service
  contain nftables::config

  Class['::nftables::install']
  -> Class['::nftables::config']
  ~> Class['::nftables::service']

}
