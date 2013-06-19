class haproxy (

  $haproxy_tarball = 'haproxy-1.4.24.tar.gz',

)  {


  Class['haproxy::install'] -> Class['haproxy::config'] ~> Class['haproxy::service']

  include haproxy::install
  include haproxy::config
  include haproxy::service

}
