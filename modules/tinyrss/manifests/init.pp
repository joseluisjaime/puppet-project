class tinyrss (

  $tinyrss_directory = '/var/www/tinytinyrss',
  $tarball = 'Tiny-Tiny-RSS-1.8.tar.gz',
  $tinyrss_user = 'tinyrss_user',
  $tinyrss_password = 'tinytinyrss',
  $mysql_root_password = hiera('mysql_root_password'),
  $tinyrss_database = 'db_tinyrss'
  
)  {

  include tinyrss::install



}
