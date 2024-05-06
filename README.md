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

`bolt plan run helixalm:install`

## Usage

Include usage examples for common use cases in the **Usage** section. Show your
users how to use your module to solve problems, and be sure to include code
examples. Include three to five examples of the most important or common tasks a
user can accomplish with your module. Show users how to accomplish more complex
tasks that involve different types, classes, and functions working in tandem.

## Limitations

This module has been tested with Ubuntu 20.04, Ubuntu 22.04, AlmaLinux 9, Red Hat Enterprise Linux 9, and Rocky Linux 9.

## Development

Development is encouraged. Please create a pull request with a description of the change and its impact.

### Contributors

Check out the [Contributors](https://github.com/paul-riley/helixalm_bolt/graphs/contributors) page!
