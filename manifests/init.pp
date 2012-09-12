# Class: jpackage
#
#  This class ensures jpackage repos are installed
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#  include jpackage
class jpackage {

  if $::osfamily == 'RedHat' {

    yumrepo {'jpackage-generic':
      descr          => 'JPackage (free), generic',
      mirrorlist     => 'http://www.jpackage.org/mirrorlist.php?dist=generic&type=free&release=5.0',
      failovermethod => 'priority',
      gpgcheck       => 1,
      gpgkey         => 'http://www.jpackage.org/jpackage.asc',
      enabled        => 1,
    }

    yumrepo {'jpackage-fc':
      descr          => "JPackage (free) for Fedora Core ${::os_maj_version}",
      mirrorlist     => "http://www.jpackage.org/mirrorlist.php?dist=fedora-${::os_maj_version}&type=free&release=5.0",
      failovermethod => 'priority',
      gpgcheck       => 1,
      gpgkey         => 'http://www.jpackage.org/jpackage.asc',
      enabled        => 0,
    }

    yumrepo {'jpackage-rhel':
      descr          => "JPackage (free) for Red Hat Enterprise Linux ${::os_maj_version}",
      mirrorlist     => "http://www.jpackage.org/mirrorlist.php?dist=redhat-el-${::os_maj_version}&type=free&release=5.0",
      failovermethod => 'priority',
      gpgcheck       => 1,
      gpgkey         => 'http://www.jpackage.org/jpackage.asc',
      enabled        => 0,
    }

    yumrepo {'jpackage-generic-nonfree':
      descr          => 'JPackage (non-free) generic',
      mirrorlist     => "http://www.jpackage.org/jpackage_Generic_nonfree_5.0.txt",
      failovermethod => 'priority',
      gpgcheck       => 1,
      gpgkey         => 'http://www.jpackage.org/jpackage.asc',
      enabled        => 0,
    }

    # Updates

    yumrepo {'jpackage-generic-updates':
      descr          => 'JPackage (free), generic',
      mirrorlist     => 'http://www.jpackage.org/mirrorlist.php?dist=generic&type=free&release=5.0-updates',
      failovermethod => 'priority',
      gpgcheck       => 1,
      gpgkey         => 'http://www.jpackage.org/jpackage.asc',
      enabled        => 1,
    }

    yumrepo {'jpackage-fc-updates':
      descr          => "JPackage (free) for Fedora Core ${::os_maj_version}",
      mirrorlist     => "http://www.jpackage.org/mirrorlist.php?dist=fedora-${::os_maj_version}&type=free&release=5.0-updates",
      failovermethod => 'priority',
      gpgcheck       => 1,
      gpgkey         => 'http://www.jpackage.org/jpackage.asc',
      enabled        => 0,
    }

    yumrepo {'jpackage-rhel-updates':
      descr          => "JPackage (free) for Red Hat Enterprise Linux ${::os_maj_version}",
      mirrorlist     => "http://www.jpackage.org/mirrorlist.php?dist=redhat-el-${::os_maj_version}&type=free&release=5.0-updates",
      failovermethod => 'priority',
      gpgcheck       => 1,
      gpgkey         => 'http://www.jpackage.org/jpackage.asc',
      enabled        => 0,
    }

    yumrepo {'jpackage-generic-nonfree-updates':
      descr          => 'JPackage (non-free) generic',
      mirrorlist     => "http://www.jpackage.org/jpackage_Generic_nonfree_5.0-updates.txt",
      failovermethod => 'priority',
      gpgcheck       => 1,
      gpgkey         => 'http://www.jpackage.org/jpackage.asc',
      enabled        => 0,
    }

  } else {
      notice ("Your operating system ${::operatingsystem} will not have the JPackage repository applied")
  }

}

