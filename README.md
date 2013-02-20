puppet-jpackage [![Build Status](https://travis-ci.org/Spredzy/puppet-jpackage.png)](https://travis-ci.org/Spredzy/puppet-jpackage)
===============

A Puppet module that ensures the jpackage repositories are installed

# About

jpackage is a module that ensures the jpackages repos are correctly installed on the system.

# Tests

* CentOS 6.x
* CentOS 5.x
* Fedora 17
* This should work on all RHEL variant

# Usage

For the latest version :

    include jpackage

For a specific version : 

    class {'jpackage':
      version => '5.0',
    }

