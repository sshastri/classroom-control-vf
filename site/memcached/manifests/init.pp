class memcached{

  package {'memcached':
    ensure => present,
    before => File['/etc/sysconfig/memcached'],
  }
  
  file { '/etc/sysconfig/memcached':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    notify  => Service['memcached'],
  }
  
  service { 'memcached':
    ensure  => running,
    enable  => true,
  }
}

