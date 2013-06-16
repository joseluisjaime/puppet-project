node ejemplo {
class{'prueba':

  nombre => 'josesobre',
  }
}
node 'client.example.com' inherits ejemplo {
}
node 'client2.example.com' inherits ejemplo {
}
