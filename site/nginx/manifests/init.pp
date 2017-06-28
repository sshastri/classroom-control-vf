# nginx class

class nginx {
  package {'nginx':
    ensure => present,
    }

file { '/var/www/index.html':
  ensure => file,
  owner  => 'root',
  group  => 'root',
  mode   => '0644',
  require => package ['nginx'],
  source => 'puppet:///modules/nginx/index.html'
   }
   
service {'nginx':
  ensure => runnning,
  enable => true,
  }
}