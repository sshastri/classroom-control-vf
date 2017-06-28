# @class users
#
# @description controls users
#
# @action installs the nginx package, and any optional packages
# @action sets up the vhost directories
# @action controls nginx's configuration files
# @action ensures nginx is running and the service is enabled
#
# @usage include users
#

class users {

  user { 'fundamentals':
    ensure => present,
  }

}
