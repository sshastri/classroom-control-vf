class nginx { 
  package { 'nginx':  
    ensure  => present,  
  }  
  file { 'document':   
    ensure  => directory,  
    path    => '/var/www',
    owner   => 'root',
    group   => 'root',
  }
  
  file { '/var/www/index.html':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    source => 'puppet:///modules/nginx/index.html',
  }
  
  
  file { '/etc/nginx/nginx.conf':
    ensure => file,
    source => 'puppet:///modules/nginx/nginx.conf',
    owner   => 'root',    
    group   => 'root',
    require => Package['nginx'],
    notify => Service['nginx'],
   }
  
  file { '/etc/nginx/conf.d/default.conf':
    ensure => file,
    source => 'puppet:///modules/nginx/default.conf',
    owner   => 'root',
    group   => 'root',
    require => Package['nginx'],
    notify => Service['nginx'],
  }
  
  service { 'nginx' :
    ensure => running,
  }
}
