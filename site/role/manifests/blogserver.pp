class role::blogserver {

  include profile::apache
  include profile::mysql
  include profile::wordpress

}
