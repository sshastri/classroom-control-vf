class wrappers::epel {
  class {'::epel':
    epel_testing_enabled => '1',
    epel-source_enabled => '1',
    }
 }
