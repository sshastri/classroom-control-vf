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

  package { 'nginx':
    ensure => present,
  }

  class { 'nginx::files': }

  class { 'nginx::service': }

}
