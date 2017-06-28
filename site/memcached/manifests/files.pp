class memcached::files {

  ## Configuring our default server block
  file { '/etc/sysconfig/memcached':
    ensure  => file,
    source  => 'puppet:///modules/memcached/memcached',
    owner   => root,
    group   => root,
    mode    => '0644',
    notify  => Service['memcached'],
    require => Package['memcached'],
  }

}
