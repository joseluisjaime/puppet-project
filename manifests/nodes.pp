node ejemplo {
  
class{'prueba':
  nombre => 'pepe'
  }
  
}
node 'client.example.com' inherits ejemplo {
}
node 'client2.example.com' inherits ejemplo {
}
