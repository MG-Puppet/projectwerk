class profile::iis (
  String $iis_site,
  String $physicalPath,
  String $applicationPool,
  String $siteDirName,
  String $siteDirPath,
){
  $iis_features = ['Web-WebServer','Web-Scripting-Tools']

  iis_feature { $iis_features:
    ensure => 'present',
  }

  iis_site {'Default Web Site':
    ensure => absent,
    require => Iis_feature['Web-WebServer'],
  }
  
  iis_site { $iis_site:
    ensure => 'started',
    physicalpath => $physicalPath,
    applicationpool => $applicationPool,
    require         => [
      File[$siteDirName],
      Iis_site['Default Web Site'],
    ],
  }

  file { $siteDirName:
    ensure => 'directory',
    path   => $siteDirPath,
  }  

}
