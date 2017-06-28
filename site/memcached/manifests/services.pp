class memcached::services {

  service { 'memcached':
    ensure  => running,
    enable  => true,
    require => [ Package['memcached'], File['/etc/sysconfig/memcached']],
  }
}
