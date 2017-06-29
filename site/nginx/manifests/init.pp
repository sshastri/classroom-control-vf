class nginx { 

  case $facts['os']['family']{
    'RedHat', 'Debian': {
      $package          = 'nginx'
      $owner            = 'root'
      $group            = 'root'
      $document_root    = '/var/www'
      $config_dir       = '/etc/nginx/'
      $svr_block_dir    = '/etc/nginx/conf.d'
      $logs_dir         = '/var/log/nginx'
    }
    'Windows': {
      $package          = 'nginx-service'
      $owner            = 'Administrator'
      $group            = 'Administrator'
      $document_root    = 'C:/ProgramData/nginx/html'
      $config_dir       = 'C:/ProgramData/nginx/'
      $svr_block_dir    = 'C:/ProgramData/nginx/conf.d'
      $logs_dir         = 'C:/ProgramData/nginx/logs'
    }
    default:{
      fail("${facts['os']['family']} is not supported")
      }

  $user => $facts['os']['family'] ? {
    'RedHat'  => 'nginx',
    'Debian'  => 'www-data',
    'Windows' => 'nobody',
    default   => 'nginx',
  }


  File {
  owner => $owner,
  group => $group,
  }
  
  package {  $package:  
    ensure  => present,  
  }  
  file { [$document_root, $svr_block_dir]: 
    ensure  => directory,  
  }
  
  file { "${document_root}/index.html":
    ensure => file,
    source => 'puppet:///modules/nginx/index.html',
  }
  
  file { "${config_dir}/nginx.conf":
    ensure  => file,
    content => epp('nginx/nginx.conf.epp', {user            => $user, 
                                             config_dir     => $config_dir, 
                                             logs_dir       => $logs_dir, 
                                             svr_block_dir  => $svr_block_dir,}),
    require => Package[$package],
    notify  => Service['nginx'],
   }
  
  file { "${svr_block_dir}/default.conf":
    ensure => file,
    content => epp('nginx/default_conf.epp', {document_root => $document_root}),
    require => Package[$package],
    notify => Service['nginx'],
  }
  
  service { 'nginx' :
    ensure => running,
    enable => true,
  }
}
