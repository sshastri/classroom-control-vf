# nginx class

class nginx {
  package {'nginx':
    ensure => present,
    }

file { '/var/www/index.html':
  ensure =>  present,
  owner  => 'root',
  group  => 'root',
  mode   => '0644',
  require => Package['nginx'],
  source => 'puppet:///modules/nginx/index.html',
   }
   
service {'nginx':
  ensure => running,
  enable => true,
  }
}
