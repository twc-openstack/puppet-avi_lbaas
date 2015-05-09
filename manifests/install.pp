# Class: avi_lbaas::install
#
# This module manages Avi LBaaS openstack plugin installation
#
class avi_lbaas::install(
  $deb         = undef,
  $fetch_url   = undef,
) {

   $tmp_dir = '/tmp/avi'
   $latest_deb = "${tmp_dir}/${deb}"

   file { $tmp_dir:
     ensure => 'directory',
     owner  => 'root',
     group  => 'root',
     mode   => '0755',
   }

   tidy { $tmp_dir:
     matches => 'avi-lbaas-driver*.deb',
     recurse => true,
   }

   wget::fetch { "${fetch_url}/${deb}":
     destination => $latest_deb,
     timeout     => 300,
     require     => File[$tmp_dir],
     before      => File[$latest_deb],
   }

   file { $latest_deb:
     ensure => present,
     before => Package['avi-lbaas-driver'],
   }

   package { 'avi-lbaas-driver':
     ensure   => latest,
     provider => dpkg,
     source   => $latest_deb,
   }

}
