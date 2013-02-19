# Class: jpackage
#
#  This class ensures jpackage repos are installed
#
# Parameters:
#
#    [*version*] : Version of jpackage that will be installed
#
# Actions:
#
# Requires:
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
class jpackage($version = '6.0') {

  if $::osfamily == 'RedHat' {

    case $version {

      '6.0' : {
        if $::operatingsystem == 'Fedora' and $::os_maj_version >= 9 and $::os_maj_version <= 17 {
          yumrepo {'jpackage-fc':
            descr          => "JPackage (free) for Fedora Core ${::os_maj_version}",
            mirrorlist     => "http://www.jpackage.org/mirrorlist.php?dist=fedora-${::os_maj_version}&type=free&release=${version}",
            failovermethod => 'priority',
            gpgcheck       => 1,
            gpgkey         => 'http://www.jpackage.org/jpackage.asc',
            enabled        => 0,
          }
        }
        else {
          yumrepo {'jpackage-generic':
            descr          => 'JPackage (free), generic',
            mirrorlist     => "http://www.jpackage.org/mirrorlist.php?dist=generic&type=free&release=${version}",
            failovermethod => 'priority',
            gpgcheck       => 1,
            gpgkey         => 'http://www.jpackage.org/jpackage.asc',
            enabled        => 1,
          }
        }
      }
      '5.0' : {
        if $::operatingsystem == 'Fedora' and $::os_maj_version >= 7 and $::os_maj_version <= 14 {
          yumrepo {'jpackage-fc':
            descr          => "JPackage (free) for Fedora Core ${::os_maj_version}",
            mirrorlist     => "http://www.jpackage.org/mirrorlist.php?dist=fedora-${::os_maj_version}&type=free&release=${version}",
            failovermethod => 'priority',
            gpgcheck       => 1,
            gpgkey         => 'http://www.jpackage.org/jpackage.asc',
            enabled        => 0,
          }
          if $::os_maj_version >= 7 and $::os_maj_version <= 12 {
            yumrepo {'jpackage-fc-updates':
              descr          => "JPackage (free) for Fedora Core ${::os_maj_version}",
              mirrorlist     => "http://www.jpackage.org/mirrorlist.php?dist=fedora-${::os_maj_version}&type=free&release=${version}-updates",
              failovermethod => 'priority',
              gpgcheck       => 1,
              gpgkey         => 'http://www.jpackage.org/jpackage.asc',
              enabled        => 0,
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
            enabled        => 0,
          }
          yumrepo {'jpackage-rhel-updates':
            descr          => "JPackage (free) for Red Hat Enterprise Linux ${::os_maj_version}",
            mirrorlist     => "http://www.jpackage.org/mirrorlist.php?dist=redhat-el-${::os_maj_version}&type=free&release=${version}-updates",
            failovermethod => 'priority',
            gpgcheck       => 1,
            gpgkey         => 'http://www.jpackage.org/jpackage.asc',
            enabled        => 0,
          }
        }
        else {
          yumrepo {'jpackage-generic':
            descr          => 'JPackage (free), generic',
            mirrorlist     => "http://www.jpackage.org/mirrorlist.php?dist=generic&type=free&release=${version}",
            failovermethod => 'priority',
            gpgcheck       => 1,
            gpgkey         => 'http://www.jpackage.org/jpackage.asc',
            enabled        => 1,
          }
          yumrepo {'jpackage-generic-updates':
            descr          => 'JPackage (free), generic',
            mirrorlist     => "http://www.jpackage.org/mirrorlist.php?dist=generic&type=free&release=${version}-updates",
            failovermethod => 'priority',
            gpgcheck       => 1,
            gpgkey         => 'http://www.jpackage.org/jpackage.asc',
            enabled        => 1,
          }
        }
      }
      default : {
        fail("${version} version of JPackage is not handles")
      }
    }
  } else {
      fail ("Your operating system ${::operatingsystem} will not have the JPackage repository applied")
  }

}

