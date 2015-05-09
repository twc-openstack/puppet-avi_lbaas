# == Class: avi_lbaas 
#
# This module installs and configures the Avi LBaaS openstack plugin 
#
# === Parameters
#
# Document parameters here.
#
# === Examples
#
#  class { 'avi_lbaas':
#  }
#
class avi_lbaas (
  $enabled = false, 
) {
  if $enabled {
    include avi_lbaas::install
    include avi_lbaas:config
  }
}
