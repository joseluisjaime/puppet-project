class haproxy (
  
  $haproxy_tarball = 'haproxy-1.4.24.tar.gz',
  $machinename = $hostname,

  $config_server1 = '',
  $config_name1 = '',
  $config_ip1 = '',
  
  $config_server2 = '',
  $config_name2 = '',
  $config_ip2 = '',

  $config_server3 = '',
  $config_name3 = '',
  $config_ip3 = '',

  
)  {


  Class['haproxy::install'] -> Class['haproxy::config'] ~> Class['haproxy::service']

  include haproxy::install
  include haproxy::config
  include haproxy::service

}
