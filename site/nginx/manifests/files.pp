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
class nginx::files inherits nginx::params {

  ## Configuring our default server block
  file { '/etc/nginx/conf.d/default.conf':
    ensure   => file,
    content  => epp('nginx/default.conf', {
      document_root => $nginx::params::document_root,
    }),
    owner    => $nginx::params::owner,
    group    => $nginx::params::group,
    mode     => '0644',
    notify   => Service['Nginx'],
    require  => Package['Nginx'],
  }

  ## This adds our base nginx.conf file, where most of our configuration is done.[ NOT TEMPLATED ]
  file { "${nginx::params::config_directory}/nginx.conf":
    ensure   => file,
    content  => epp('nginx/nginx.conf', {
      service_user           => $nginx::params::service_user,
      logs_directory         => $nginx::params::logs_directory,
      config_directory       => $nginx::params::config_directory,
      server_block_directory => $nginx::params::server_block_directory,
    }),
    owner    => $nginx::params::owner,
    group    => $nginx::params::group,
    mode     => '0644',
    notify   => Service['Nginx'],
    require  => Package['Nginx'],
  }

  ## This sets up the basic file structure for the web root
  file { $nginx::params::document_root:
    ensure  => directory,
    owner   => $nginx::params::service_user,
    group   => $nginx::params::service_user,
    mode    => '0755',
    require => Package['Nginx'],
  }

  file { '/var/www/index.html':
    ensure   => file,
    source  => 'puppet:///modules/nginx/index.html',
    owner    => $nginx::params::service_user,
    group    => $nginx::params::service_user,
    mode     => '0644',
    require  => File[$nginx::params::document_root],
  }
}
