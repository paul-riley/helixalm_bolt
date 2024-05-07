# Helix ALM


## Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with Helix ALM](#setup)
    * [What Helix ALM affects](#what-helix-alm-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with helixalm](#beginning-with-helixalm)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

The Helix ALM module installs Helix ALM on Linux systems using a Bolt install plan.

## Setup

### What Helix ALM affects

This does a complete system configuration to run the Helix ALM install. 

With Enterprise Linux systems it will turn off Selinux. With all systems, it will configured the firewall, turn it on, allow for cgi, and ensure Apache is running.


### Setup Requirements 

A [completed Bolt installation](https://www.puppet.com/docs/bolt/latest/bolt_installing#install-bolt-on-ubuntu) is required.

### Beginning with Helix ALM

Install the module. It currently has a single plan:

`bolt plan run helixalm::install`

## Usage

1. Install the module.
1. Run: `bolt plan run helixalm::install`.
1. Unzip the correct HelixALM tar ball.
1. Run the HelixALM installer.
1. Start the license server: `/usr/bin/spls start`
1. Start HelixALM: `/usr/bin/ttstudio` start

## Limitations

This module has been tested with Ubuntu 20.04, Ubuntu 22.04, AlmaLinux 9, Red Hat Enterprise Linux 9, and Rocky Linux 9. It is not supported for deviations or alternative operating systems.

## Development

Development is encouraged. Please create a pull request with a description of the change and its impact.

### Contributors

Check out the [Contributors](https://github.com/paul-riley/helixalm_bolt/graphs/contributors) page!
