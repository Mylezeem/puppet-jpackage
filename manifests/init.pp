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

    yumrepo {'jpackage-generic':
      descr          => 'JPackage (free), generic',
      mirrorlist     => "http://www.jpackage.org/mirrorlist.php?dist=generic&type=free&release=${version}",
      failovermethod => 'priority',
      gpgcheck       => 1,
      gpgkey         => 'http://www.jpackage.org/jpackage.asc',
      enabled        => 1,
    }

    yumrepo {'jpackage-fc':
      descr          => "JPackage (free) for Fedora Core ${::os_maj_version}",
      mirrorlist     => "http://www.jpackage.org/mirrorlist.php?dist=fedora-${::os_maj_version}&type=free&release=${version}",
      failovermethod => 'priority',
      gpgcheck       => 1,
      gpgkey         => 'http://www.jpackage.org/jpackage.asc',
      enabled        => 0,
    }

    yumrepo {'jpackage-rhel':
      descr          => "JPackage (free) for Red Hat Enterprise Linux ${::os_maj_version}",
      mirrorlist     => "http://www.jpackage.org/mirrorlist.php?dist=redhat-el-${::os_maj_version}&type=free&release=${version}",
      failovermethod => 'priority',
      gpgcheck       => 1,
      gpgkey         => 'http://www.jpackage.org/jpackage.asc',
      enabled        => 0,
    }

    # Updates

    yumrepo {'jpackage-generic-updates':
      descr          => 'JPackage (free), generic',
      mirrorlist     => "http://www.jpackage.org/mirrorlist.php?dist=generic&type=free&release=${version}-updates",
      failovermethod => 'priority',
      gpgcheck       => 1,
      gpgkey         => 'http://www.jpackage.org/jpackage.asc',
      enabled        => 1,
    }

    yumrepo {'jpackage-fc-updates':
      descr          => "JPackage (free) for Fedora Core ${::os_maj_version}",
      mirrorlist     => "http://www.jpackage.org/mirrorlist.php?dist=fedora-${::os_maj_version}&type=free&release=${version}-updates",
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

  } else {
      notice ("Your operating system ${::operatingsystem} will not have the JPackage repository applied")
  }

}

