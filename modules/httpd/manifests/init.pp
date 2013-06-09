class httpd {
package { "nginx": ensure => purged,
}
file { "/usr/share/nginx/www/texto":
owner => "www-data",
group => "www-data",
mode => 640,
ensure => absent,
source => "puppet:///httpd/texto";
}
service { "nginx::server":
name => nginx,
ensure => stopped,
enable => false,
} 
}
