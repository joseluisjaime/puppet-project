class memcached {
package { "memcached": ensure => purged,
}
service { "memcached::server":
name => memcached,
ensure => stopped,
enable => false,
}
}
