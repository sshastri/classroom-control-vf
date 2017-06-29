# nginx class

class nginx (
 $owner    = $nginx::params::owner,
 $group    = $nginx::params::group,
 $package  = $nginx::params::package,
 $doc_root = $nginx::params::doc_root,
) inherits nginx::params {
 
  package { $package:
    ensure => present,
    }
    
File {
  owner  => $owner,
  group  => $group,
  mode   => '0644',
  }

file { $doc_root:
  ensure => directory,
  }

file { "${doc_root}/index.html":
  ensure =>  present,
  require => Package['nginx'],
  source => 'puppet:///modules/nginx/index.html',
   }
   
file { '/etc/nginx/conf.d/default.conf':
  ensure =>  present,
  source => 'puppet:///modules/nginx/default.conf',
   } 
   
 file { '/etc/nginx/nginx.conf':
  ensure =>  present,
  source => 'puppet:///modules/nginx/nginx.conf',
   }    
   
service {'nginx':
  ensure => running,
  enable => true,
  }
}
