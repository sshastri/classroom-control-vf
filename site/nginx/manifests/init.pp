# nginx class

class nginx {
  package {'nginx':
    ensure => present,
    }
    
file { '/var/www/':
  ensure => directory,
  }

file { '/var/www/index.html':
  ensure =>  present,
  owner  => 'root',
  group  => 'root',
  mode   => '0644',
  require => Package['nginx'],
  source => 'puppet:///modules/nginx/index.html',
   }
   
file { '/etc/nginx/conf.d/default.conf':
  ensure =>  present,
  owner  => 'root',
  group  => 'root',
  mode   => '0644',
  source => 'puppet:///modules/nginx/default.conf',
   } 
   
 file { '/etc/nginx/nginx.conf':
  ensure =>  present,
  owner  => 'root',
  group  => 'root',
  mode   => '0644',
  source => 'puppet:///modules/nginx/nginx.conf',
   }    
   
service {'nginx':
  ensure => running,
  enable => true,
  }
}
