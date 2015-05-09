# Class: avi_lbaas::config
#
# This module configures Avi LBaaS openstack plugin
#
class avi_lbaas::config (
  $avi_controller_ip    = undef,
  $provider_name        = 'avi_lbaas',
  $admin_user           = 'admin',
  $admin_password       = undef,
) {
  $avi_installer_location = '/opt/avi/openstack_lbplugin/install.sh'
  $cmd = join([
    "${avi_installer_location}",
    "--aip ${avi_controller_ip}",
    "--aname ${provider_name}",
    "--auser '${admin_user}'",
    "--apass '${admin_password}'",
    "--reuse-sp --no-prompt --update"],
    ' ')

  exec {"Avi plugin install script":
    command => $cmd,
    require => Package['avi-lbaas-driver'],
  }
}
