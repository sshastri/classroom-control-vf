class nginx { 
  package { 'nginx':  
    ensure  => present,  
  }  
  file { 'document':   
    ensure  => directory,  
    path    => '/var/www'  
    owner   => 'root',
    group   => 'root',
  }
  
  file { '/var/www/index.html':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    source => 'puppet:///modules/nginx/index.html',
  }
  
  service { 'nginx' :
    ensure => running,
  }
}
