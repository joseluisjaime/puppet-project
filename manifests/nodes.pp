node ejemplo {
include prueba
}
node 'client.example.com' inherits ejemplo {
  class { 'snmp':}
}
node 'client2.example.com' inherits ejemplo {
}
