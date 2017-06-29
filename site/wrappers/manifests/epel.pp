class wrappers::epel {
  class { '::epel':
    epel_enabled => '1',
    epel_testing_enabled => '0',
    epel_source_enabled => '0',
  }
}
