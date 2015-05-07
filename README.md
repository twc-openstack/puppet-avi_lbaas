# puppet-avi_lbaas

#### Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Usage](#usage)
4. [Limitations](#limitations)

## Overview

This module installs and configures Avi LBaaS openstack plugin.

## Module Description

This module will install Avi LBaaS openstack plugin from a specified url location,
and set up Avi controller IP and credentials for the plugin.

## Usage

include ::avi_lbaas (see init.pp for default args)

## Limitations

This module does not install or configure Avi controllers.
