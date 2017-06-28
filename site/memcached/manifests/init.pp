class memcached {

  package { 'memcached':
    ensure => present,
  }

  class { 'memcached::files': }

  class { 'memcached::service': }

}
