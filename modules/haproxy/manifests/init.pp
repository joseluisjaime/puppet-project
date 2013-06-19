class haproxy (
  
  $haproxy_tarball = 'haproxy-1.4.24.tar.gz',
  $machinename = $hostname,
  $config_server = 'server',
  $config_name1 = '',
  $config_name2 = '',
  $config_ip1 = '',
  $config_ip2 = '',
  
)  {


  Class['haproxy::install'] -> Class['haproxy::config'] ~> Class['haproxy::service']

  include haproxy::install
  include haproxy::config
  include haproxy::service

}
