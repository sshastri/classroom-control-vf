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
class nginx::params {

  case $facts['os']['family'] {
    'RedHat', 'Debian': {
      $package_name           = 'nginx'
      $service_name           = 'nginx'
      $owner                  = 'root'
      $group                  = 'root'
      $document_root          = '/var/www/'
      $config_directory       = '/etc/nginx'
      $server_block_directory = '/etc/nginx/conf.d'
      $logs_directory         = '/var/log/nginx'

      case $facts['os']['family'] {
        'RedHat': {
          $service_user           = 'nginx'
        }
        'Debian': {
          $service_user           = 'www-data'
        }
      }
    }

    'Windows': {
      $package_name           = 'nginx-service'
      $service_name           = 'nginx'
      $owner                  = 'Administrator'
      $group                  = 'Administrator'
      $service_user           = 'nobody'
      $document_root          = 'C:/ProgramData/nginx/html'
      $config_directory       = 'C:/ProgramData/nginx'
      $server_block_directory = 'C:/ProgramData/nginx/conf.d'
      $logs_directory         = 'C:/ProgramData/nginx/logs'
    }
    default: {
      fail('Your operating system is not supported.')
    }
  }
}
