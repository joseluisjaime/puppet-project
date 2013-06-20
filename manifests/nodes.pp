node 'client.example.com' {
  include haproxy
}
node 'client2.example.com' {
  include apache
  include php
  include mysql
  include tinyrss
}
node 'client3.example.com' {

}
node 'backend2.example.com' {

}
node 'backend3.example.com' {
  include apache
  include php
}
node 'puppetclient1.example.com' {
  include prueba
}
