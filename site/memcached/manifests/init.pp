class memcached {
   package {'memcached':
     ensure => present,
     }
     
   file {'/etc/sysconfig/memcached':
     ensure => file,
     owner => 'root'
     groups => 'root',
     mode => '0644',
     source => 'puppet:///modules/memcached/memcached',
     }
     
   service {'memcached':
     ensure  => running,
     enable  => true,
     require => Package['memcached'],
     subscribe => File['/etc/sysconfig/memcached'],
     }
    
}
     
