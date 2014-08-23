# Class: jpackage
#
#  This class ensures jpackage repositories are installed
#
# Parameters:
#
#  [*version*]
#    Version of jpackage that will be installed
#
#  [*repo_enable*]
#    (Boolean) Whether or not the main repository should be enabled
#    Default: true
#
#  [*update_enable*]
#    (Boolean) Whether or not the update repository should be enabled
#    Default: true
#
# Sample Usage:
#
#  For the latest version
#
#     include jpackage
#
#  For a specific version
#
#     class {'jpackage' :
#         version => '5.0',
#    }
#
class jpackage(
  $version       = '6.0',
  $repo_enable   = true,
  $update_enable = true,
) {

  include ::stdlib

  if $::osfamily == 'RedHat' {

    case $version {

      '6.0' : {
        yumrepo {'jpackage-generic':
          descr          => 'JPackage (free), generic',
          mirrorlist     => "http://www.jpackage.org/mirrorlist.php?dist=generic&type=free&release=${version}",
          failovermethod => 'priority',
          gpgcheck       => 1,
          gpgkey         => 'http://www.jpackage.org/jpackage.asc',
          enabled        => bool2num($repo_enable),
        }
        if $::operatingsystem == 'Fedora' and $::os_maj_version >= 9 and $::os_maj_version <= 17 {
          yumrepo {'jpackage-fc':
            descr          => "JPackage (free) for Fedora Core ${::os_maj_version}",
            mirrorlist     => "http://www.jpackage.org/mirrorlist.php?dist=fedora-${::os_maj_version}&type=free&release=${version}",
            failovermethod => 'priority',
            gpgcheck       => 1,
            gpgkey         => 'http://www.jpackage.org/jpackage.asc',
            enabled        => bool2num($update_enable),
          }
        }
      }
      '5.0' : {
        yumrepo {'jpackage-generic':
          descr          => 'JPackage (free), generic',
          mirrorlist     => "http://www.jpackage.org/mirrorlist.php?dist=generic&type=free&release=${version}",
          failovermethod => 'priority',
          gpgcheck       => 1,
          gpgkey         => 'http://www.jpackage.org/jpackage.asc',
          enabled        => bool2num($repo_enable),
        }
        yumrepo {'jpackage-generic-updates':
          descr          => 'JPackage (free), generic',
          mirrorlist     => "http://www.jpackage.org/mirrorlist.php?dist=generic&type=free&release=${version}-updates",
          failovermethod => 'priority',
          gpgcheck       => 1,
          gpgkey         => 'http://www.jpackage.org/jpackage.asc',
          enabled        => bool2num($update_enable),
        }
        if $::operatingsystem == 'Fedora' and $::os_maj_version >= 7 and $::os_maj_version <= 14 {
          yumrepo {'jpackage-fc':
            descr          => "JPackage (free) for Fedora Core ${::os_maj_version}",
            mirrorlist     => "http://www.jpackage.org/mirrorlist.php?dist=fedora-${::os_maj_version}&type=free&release=${version}",
            failovermethod => 'priority',
            gpgcheck       => 1,
            gpgkey         => 'http://www.jpackage.org/jpackage.asc',
            enabled        => bool2num($repo_enable),
          }
          if $::os_maj_version >= 7 and $::os_maj_version <= 12 {
            yumrepo {'jpackage-fc-updates':
              descr          => "JPackage (free) for Fedora Core ${::os_maj_version}",
              mirrorlist     => "http://www.jpackage.org/mirrorlist.php?dist=fedora-${::os_maj_version}&type=free&release=${version}-updates",
              failovermethod => 'priority',
              gpgcheck       => 1,
              gpgkey         => 'http://www.jpackage.org/jpackage.asc',
              enabled        => bool2num($update_enable),
            }
          }
        }
        elsif $::operatingsystem == 'RedHat' and ($::os_maj_version == 4 or $::os_maj_version == 5) {
          yumrepo {'jpackage-rhel':
            descr          => "JPackage (free) for RedHat Entreprise Linux  ${::os_maj_version}",
            mirrorlist     => "http://www.jpackage.org/mirrorlist.php?dist=redhat-el-${::os_maj_version}&type=free&release=${version}",
            failovermethod => 'priority',
            gpgcheck       => 1,
            gpgkey         => 'http://www.jpackage.org/jpackage.asc',
            enabled        => bool2num($repo_enable),
          }
          yumrepo {'jpackage-rhel-updates':
            descr          => "JPackage (free) for Red Hat Enterprise Linux ${::os_maj_version}",
            mirrorlist     => "http://www.jpackage.org/mirrorlist.php?dist=redhat-el-${::os_maj_version}&type=free&release=${version}-updates",
            failovermethod => 'priority',
            gpgcheck       => 1,
            gpgkey         => 'http://www.jpackage.org/jpackage.asc',
            enabled        => bool2num($update_enable),
          }
        }
      }
      default : {
        fail("${version} version of JPackage is not handled")
      }
    }
    } else {
      fail ("Your operating system ${::operatingsystem} will not have the JPackage repository applied")
    }

}
