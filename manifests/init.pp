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

    case $::operatingsystem {

      'Fedora' : {
        yumrepo {'jpackage-fc':
          descr          => "JPackage (free) for Fedora Core ${::os_maj_version}",
          mirrorlist     => "http://www.jpackage.org/mirrorlist.php?dist=fedora-${::os_maj_version}&type=free&release=${version}",
          failovermethod => 'priority',
          gpgcheck       => 1,
          gpgkey         => 'http://www.jpackage.org/jpackage.asc',
          enabled        => 0,
        }
      }

      'RedHat' : {
        yumrepo {'jpackage-rhel':
          descr          => "JPackage (free) for Red Hat Enterprise Linux ${::os_maj_version}",
          mirrorlist     => "http://www.jpackage.org/mirrorlist.php?dist=redhat-el-${::os_maj_version}&type=free&release=${version}",
          failovermethod => 'priority',
          gpgcheck       => 1,
          gpgkey         => 'http://www.jpackage.org/jpackage.asc',
          enabled        => 0,
        }
      }

      default : {
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

    # Updates
    #
    # JPacakge 6.0 does not provide updates repositories yet
    #
    if $version == '5.0' {

      case $::operatingsystem {

        'Fedora' : {
          yumrepo {'jpackage-fc-updates':
            descr          => "JPackage (free) for Fedora Core ${::os_maj_version}",
            mirrorlist     => "http://www.jpackage.org/mirrorlist.php?dist=fedora-${::os_maj_version}&type=free&release=${version}-updates",
            failovermethod => 'priority',
            gpgcheck       => 1,
            gpgkey         => 'http://www.jpackage.org/jpackage.asc',
            enabled        => 0,
          }
        }

        'RedHat' : {
          yumrepo {'jpackage-rhel-updates':
            descr          => "JPackage (free) for Red Hat Enterprise Linux ${::os_maj_version}",
            mirrorlist     => "http://www.jpackage.org/mirrorlist.php?dist=redhat-el-${::os_maj_version}&type=free&release=${version}-updates",
            failovermethod => 'priority',
            gpgcheck       => 1,
            gpgkey         => 'http://www.jpackage.org/jpackage.asc',
            enabled        => 0,
          }
        }

        default : {
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

    }
    } else {
      notice ("Your operating system ${::operatingsystem} will not have the JPackage repository applied")
    }

}

