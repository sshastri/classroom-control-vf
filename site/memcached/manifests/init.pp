class memcached {
  package { 'memcached':
  ensure => present,
  }
  
  file { 'Memcached File':
  path => '/etc/sysconfig/memcached',
  ensure => file,
  source => 'puppet:///modules/memcached/memcached',
  require => Package['memcached'],
  notify => Service['memcached'],
  }
  
  service { 'memcached':
  ensure => running,
  enable => true,
  }

}
