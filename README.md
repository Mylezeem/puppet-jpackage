# puppet-jpackage

[![Build Status](https://travis-ci.org/Mylezeem/puppet-jpackage.png)](https://travis-ci.org/Mylezeem/puppet-jpackage)


## Overview

A Puppet module that ensures the [jpackage](http://www.jpackage.org) repositories are installed.

The JPackage Project has two primary goals:

* To provide a coherent set of Java software packages for Linux, satisfying all quality requirements of other applications.
* To establish an efficient and robust policy for Java software packaging and installation.

## Usage

For the latest version :

```puppet
include jpackage
```

For a specific version : 

```puppet
class {'jpackage':
  version => '5.0',
}
```

One can decide if repository should be enabled or not :

```puppet
class {'jpackage':
  version       => '5.0',
  repo_enable   => true,
  update_enable => false,
}
```

## Parameters


#### `version`

Version of jpackage that will be installed

#### `repo_enable`

Whether or not the main repository should be enabled

#### `update_enable`

Whether or not the update repository should be enabled

## Limitations

This module works for :

* EL 6
* EL 5
* Fedora 17

