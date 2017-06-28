# @class nginx::files
#
# @description creates the file and service structure
#
# @action creates the file and service structure
#
# @requires nginx
#
# @usage include nginx::files
#
class nginx::files {

  ## Configuring our default server block
  file { '/etc/nginx/conf.d/default.conf':
    ensure  => file,
    source  => 'puppet:///modules/nginx/default.conf'
    owner   => root,
    group   => root,
    mode    => '0644',
    notify  => Service['nginx'],
    require => Package['nginx'],
  }

  ## This adds our base nginx.conf file, where most of our configuration is done.[ NOT TEMPLATED ]
  file { '/etc/nginx/nginx.conf':
    ensure  => file,
    source  => 'puppet:///modules/nginx/nginx.conf',
    owner   => root,
    group   => root,
    mode    => '0644',
    notify  => Service['nginx'],
    require => Package['nginx'],
  }

  ## This sets up the basic file structure for the web root
  file { '/var/www':
    ensure  => directory,
    owner   => 'nginx',
    group   => 'nginx',
    mode    => '0755',
    require => Package['nginx'],
  }

  file { '/var/www/index.html':
    ensure  => file,
    source  => 'puppet:///modules/nginx/index.html',
    owner   => 'nginx',
    group   => 'nginx',
    mode    => '0644',
    require => File['/var/www'],
  }
}
