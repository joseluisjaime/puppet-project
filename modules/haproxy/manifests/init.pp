class haproxy (
  
  $haproxy_tarball = hiera('haproxy_tarball'),
  $haproxy_socat_package = hiera('haproxy_socat_package'),
  $machinename = $hostname,

  $config_server1 = hiera('config_server1'),
  $config_name1 = hiera('config_name1'),
  $config_ip1 = hiera('config_ip1'),
  
  $config_server2 = hiera('config_server2'),
  $config_name2 = hiera('config_name2'),
  $config_ip2 = hiera('config_ip2'),

  $config_server3 = hiera('config_server3'),
  $config_name3 = hiera('config_name3'),
  $config_ip3 = hiera('config_ip3'),

  
)  {


  Class['haproxy::install'] -> Class['haproxy::config'] ~> Class['haproxy::service']

  include haproxy::install
  include haproxy::config
  include haproxy::service

}
