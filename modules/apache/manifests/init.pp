class apache (

  $package = 'apache2',
  $indexhtml = '/var/www/index.html',
  $service = 'apache2',
  $machinename = $hostname,
  $machineip = $ipaddress,
  
) {

  Class['apache::install'] -> Class['apache::config'] ~> Class['apache::service']

  include apache::install
  include apache::config
  include apache::service

}
