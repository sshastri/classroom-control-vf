# @class nginx::service
#
# @description controls the httpd service
#
# @action ensures the httpd service is enabled and running
#
# @requires nginx
#
# @usage include nginx::service
#
class nginx::service {

  service { 'nginx':
    ensure  => running,
    enable  => true,
    require => Package['nginx'],
  }
}
