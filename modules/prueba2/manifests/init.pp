class prueba2 {
file { "/root/ficherofunciona":
owner => root,
group => root,
mode => 400,
source => "puppet:///modules/prueba2/ficherodeprueba",
}
}
