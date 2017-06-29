define users::managed_user (
  $account_name  = $title,
  ) {

    $home_path = "/home/${account_name}"

    user { $account_name:
      ensure     =>  present,
      shell      =>  '/bin/bash',
      home       =>  $home_path,
      groups     =>  $account_name,
      managehome =>  true,
    }

    group { $account_name:
      ensure => present,
    }

    file { $home_path:
      ensure => directory,
      owner  => $account_name,
      group  => $account_name,
      mode   => '0700',
    }

    file { "${home_path}/.ssh":
      ensure => directory,
      owner  => $account_name,
      group  => $account_name,
      mode   => '0700',
    }

}
