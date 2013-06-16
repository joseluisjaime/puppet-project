class prueba (

  $nombre = hiera('nombre')

)  {
file { "/root/ficherodeprueba":
owner => root,
group => root,
mode => 400,
content => template('prueba/prueba.erb'),
}
}
