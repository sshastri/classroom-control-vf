class wrappers::epel {
  class { '::epel':
    epel_testing_enabled => '0',
    epel_source_enabled => '1',
  }
}
