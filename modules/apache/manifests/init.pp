class apache (

  $apache_package = 'apache2',
  $indexhtml = '/var/www/index.html',
  $apache_service = 'apache2',
  $machinename = $hostname,
  $machineip = $ipaddress,
  $osname = $operatingsystem,
  
) {

  Class['apache::install'] -> Class['apache::config'] ~> Class['apache::service']

  include apache::install
  include apache::config
  include apache::service

}
