node ejemplo {
class{'prueba':
  nombre => 'sobreescribitjose',
    }
}
node 'client.example.com' inherits ejemplo {
}
node 'client2.example.com' inherits ejemplo {
}
