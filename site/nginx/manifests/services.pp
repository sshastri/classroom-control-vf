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
class nginx::services {

  service { 'Nginx':
    name    => $nginx::params::service_name,
    ensure  => running,
    enable  => true,
    require => Package['Nginx'],
  }
}
