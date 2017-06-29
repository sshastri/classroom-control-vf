class nginx {

  case $::osfamily {
    'RedHat', 'Debian' : {
      $package  = 'nginx'
      $owner    = 'root'
      $group    = 'root'
      $docroot  = '/var/www'
      $confdir  = '/etc/nginx'
      $blockdir = '/etc/nginx/conf.d'
      $logdir   = '/var/log/nginx'
    }
    'windows' : {
      $package  = 'nginx-service'
      $owner    = 'Administrator'
      $group    = 'Administrators'
      $docroot  = 'C:/ProgramData/nginx/html'
      $confdir  = 'C:/ProgramData/nginx'
      $blockdir = 'C:/ProgramData/nginx/conf.d'
      $logdir   = 'C:/ProgramData/nginx/logs'
    }
    default : {
      fail ( 'This operating system is not supported' )
    }
  }

  #Need to figure out the user..
  $user = $::osfamily ? {
    'RedHat'  => 'nginx',
    'Debian'  => 'www-data',
    'windows' => 'nobody',
    default   =>  'nginx',
  }

  package { $package :
    ensure =>  present,
  }

  File {
    owner => $owner,
    group => $group,
    mode  => '0644',
  }

  file { $docroot :
    ensure => directory,
  }

  file { "${docroot}/index.html" :
    ensure => file,
    source =>  'puppet:///modules/nginx/index.html',
  }

  # Todo : Change this to a template...
  file { "${confdir}/nginx.conf" :
    ensure  => file,
    content =>  epp('nginx/nginx.conf.epp', {
                                              user     => $user,
                                              logdir   => $logdir,
                                              confdir  => $confdir,
                                              blockdir => $blockdir,
                                            }),
   }

  file { "${blockdir}/default.conf" :
    ensure  => file,
    content =>  epp( 'nginx/default.conf.epp', { docroot => $docroot } ),
  }

  service { 'nginx' :
    ensure  => running,
    enable  =>  true,
  }

}
