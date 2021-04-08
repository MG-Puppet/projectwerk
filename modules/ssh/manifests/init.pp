class ssh (
  String $pkg_name,
  String $service_name,
  String $config_path,
  String $config_source,
  String $provider,
) {

  contain ssh::install
  contain ssh::service
  contain ssh::config

  Class['::ssh::install']
  -> Class['::ssh::config']
  ~> Class['::ssh::service']
  
}
