class haproxy::install {


  file {'haproxy_tarball':
    owner => root,
    group => root,
    mode => 0775,
    source => 'puppet:///modules/haproxy/${haproxy::haproxy_tarball}',
    path => '/tmp/${haproxy::haproxy_tarball}',

}
