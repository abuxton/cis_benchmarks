#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with cis_benchmarks](#setup)
    * [What cis_benchmarks affects](#what-cis_benchmarks-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with cis_benchmarks](#beginning-with-cis_benchmarks)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

MTN implimentation of CIS module with allowance for changing versions.

## Module Description

Applys configuration and tests for CIS benchmark from http://cisecurity.org/
Initially reimpliments V1.0.0 and developed to impliment V2.1.1

Supports use of Hieradata, and params.pp class.
uses Added execute control functionality from `bossbear/cis_benchmarks` and  rule_specialperms.pp (and matching rule_specialperms hash in common.yaml) where one can add any extra hashes (file/dir: permission) to enforce permissions on files or directories

CIS benchmark versions supported by OS

| OS | versions |
|----|----------|
| redhat | 1.0.0, 2.10 |


## Setup
clone the module:
    git clone http://github.com/abuxton/cis_benchmarks
    or
    puppet module install abuxton-cis_benchmarks

(See Usage below for staging dependent modules)

### What cis_benchmarks affects

main list of subsystems impacted:
* sshd (and anything that requires authentication)
* auditd
* cron
* grub
* su
* kernel parameters
* network parameters
* selinux


### Setup Requirements **OPTIONAL**

Currently, this module requires 4 additional modules:

1. puppetlabs-stdlib
2. herculesteam-augeasproviders_core
2. herculesteam-augeasproviders_pam
3. fiddyspence-sysctl

### Beginning with cis_benchmarks

Once you've cloned it you can run it two ways:

1. Stage all dependent modules in fixtures and run against spec/fixtures/modules directory.  Following the below steps as root:

        cd cis_benchmarks
        bundle install --path vendor/bundle
        bundle exec rake spec_prep  #this will populate spec/fixtures/modules dir.
        puppet apply -v --modulepath spec/fixtures/modules examples/init.pp
2. Manually stage the dependent modules and run against /etc/puppetlabs/code/environments/production/modules directory:

      puppet module install puppetlabs-stdlib
      puppet module install herculesteam-augeasproviders_core
      puppet module install herculesteam-augeasproviders_pam
      puppet module install fiddyspence-sysctl
      cd cis_benchmarks
      puppet apply -v --modulepath /etc/puppetlabs/code/environments/production/modules examples/init.pp

Obviously, you can add --noop flag to run things in an audit mode.

In order to run RSpec testing run the following commands:

    cd cis_benchmarks
    bundle install --path vendor/path
    bundle exec rake spec

In order to run beaker testing run the following commands:

    cd cis_benchmarks
    bundle install --path vendor/path
    bundle exec rake beaker:centos-7-x86_64-docker

## Usage

Strongly suggest profiling the module with trlinkin/noop  

##Reference



## Limitations

This module was tested using Puppet Agent 4.7 and have been tested on following systems:
1. RedHat 7 x64
2. CentOS 7 x64

#### firewall
The module will test for components and deploy certain packages but it does not enforce iptables or firewalld rules we suggest puppetlabs/firewall for those tasks



## Development

Since your module is awesome, other users will want to play with it. Let them know what the ground rules for contributing are.
TODO
----

RHEL6 support
Tidy up custom facts currently does not support changing script dir or missing scripts well

## Release Notes/Contributors/Etc **Optional**

Based on the work:
bossbear/cis_benchmarks
