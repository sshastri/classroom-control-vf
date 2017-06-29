# nginx class

class nginx {
  
  case $::osfamily {
    'RedHat', 'Debian' : {
      $owner    = 'root',
      $group    = 'root',
      $package  = 'nginx',
      $doc_root = '/var/www',
      }
      
     'Windows' : {
      $owner    = 'Administrator',
      $group    = 'Administrators',
      $package  = 'nginx-service',
      $doc_root = 'C:/ProgramData/nginx/html',
     }
  default: {
      fail ('This operating system is not supported.')
      }
  }
  
    
  package { $package:
    ensure => present,
    }
    
File {
  owner  => $owner,
  group  => $group,
  mode   => '0644',
  }

file { $doc_root:
  ensure => directory,
  }

file { "${doc_root}/index.html":
  ensure =>  present,
  require => Package['nginx'],
  source => 'puppet:///modules/nginx/index.html',
   }
   
file { '/etc/nginx/conf.d/default.conf':
  ensure =>  present,
  source => 'puppet:///modules/nginx/default.conf',
   } 
   
 file { '/etc/nginx/nginx.conf':
  ensure =>  present,
  source => 'puppet:///modules/nginx/nginx.conf',
   }    
   
service {'nginx':
  ensure => running,
  enable => true,
  }
}
