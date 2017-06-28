# @class nginx
#
# @description installs nginx
#
# @action installs the nginx package, and any optional packages
# @action sets up the vhost directories
# @action controls nginx's configuration files
# @action ensures nginx is running and the service is enabled
#
# @usage include nginx
#

class nginx {

  include nginx::params

  package { 'Nginx':
    name   => $nginx::params::package_name,
    ensure => present,
  }

  include nginx::files

  include nginx::services

}
