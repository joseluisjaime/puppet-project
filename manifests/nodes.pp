node ejemplo {
include prueba
}
node 'client.example.com' inherits ejemplo {
include httpd
include prueba2
}
node 'client2.example.com' inherits ejemplo {
include memcached
}
