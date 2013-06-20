node 'client.example.com' {

}
node 'client2.example.com' {
  include apache
  include php
}
node 'client3.example.com' {

}
node 'prueba1.example.com' {
  include app_tinyrss
}
