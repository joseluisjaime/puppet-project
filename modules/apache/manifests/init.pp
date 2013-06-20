class apache (

  $apache_package = hiera('apache_package'),
  $indexhtml = hiera('indexhtml'),
  $apache_service = hiera('apache_service'),
  $machinename = $hostname,
  $machineip = $ipaddress,
  $osname = $operatingsystem,
  
) {

  Class['apache::install'] -> Class['apache::config'] ~> Class['apache::service']

  include apache::install
  include apache::config
  include apache::service

}
