# @class skeleton
#

class skeleton {

  file { '/etc/skel':
    ensure => directory,
    owner  => root,
    group  => root,
    mode   => '0755',
  }

  file { '/etc/skel/.bashrc':
    ensure  => file,
    source  => 'puppet:///modules/skeleton/.bashrc',
    owner   => root,
    group   => root,
    mode    => '0644',
    require => File['/etc/skel'],
  }
}
