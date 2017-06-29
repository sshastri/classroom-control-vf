class nginx::params {

  case $::os["family"] {
    'RedHat', 'Debian' : {
      $owner    = 'root'
      $group    = 'root'
      $package  = 'nginx'
      $doc_root = '/var/www'
      }
      
     'Windows' : {
      $owner    = 'Administrator'
      $group    = 'Administrators'
      $package  = 'nginx-service'
      $doc_root = 'C:/ProgramData/nginx/html'
     }
  default: {
      fail ('This operating system is not supported.')
      }
  }

}
