class tinyrss (

  $tinyrss_directory = hiera('tinyrss_directory'),
  $tinyrss_tarball = hiera('tinyrss_tarball'),
  $tinyrss_user = hiera('tinyrss_user'),
  $tinyrss_password = hiera('tinyrss_password'),
  $mysql_root_password = hiera('mysql_root_password'),
  $tinyrss_database = hiera('tinyrss_database'),
  $machineip = $ipaddress,
  
)  {

  Class['tinyrss::install'] -> Class['tinyrss::config']

  include tinyrss::install
  include tinyrss::config

}
