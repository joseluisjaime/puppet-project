node ejemplo {
include prueba
}
node 'client.example.com' inherits ejemplo {
include httpd
}
node 'client2.example.com' inherits ejemplo {
include memcached
}
