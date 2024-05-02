# This file was automatically generated on 2024-05-02 14:20:29 -0600.
# Use the 'puppet generate types' command to regenerate this file.

# @summary
#   Assigns a service to a specific firewalld zone.
# 
# Assigns a service to a specific firewalld zone.
# 
# `firewalld_service` will autorequire the `firewalld_zone` specified
# in the `zone` parameter or the `firewalld_policy` specified in the
# `policy` parameter and the `firewalld::custom_service` specified in
# the `service` parameter. There is no need to manually add
# dependencies for this.
# 
# @example Allowing SSH
#   firewalld_service {'Allow SSH in the public Zone':
#       ensure  => present,
#       zone    => 'public',
#       service => 'ssh',
#   }
Puppet::Resource::ResourceType3.new(
  'firewalld_service',
  [
    # Manage the state of this type.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure')
  ],
  [
    # Name of the service resource in Puppet
    Puppet::Resource::Param(Any, 'name', true),

    # Name of the service to add
    Puppet::Resource::Param(Any, 'service'),

    # Name of the zone to which you want to add the service, exactly one of zone and policy must be supplied
    Puppet::Resource::Param(Any, 'zone'),

    # Name of the policy to which you want to add the service, exactly one of zone and policy must be supplied
    Puppet::Resource::Param(Any, 'policy'),

    # The specific backend to use for this `firewalld_service`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # firewall_cmd
    # : Interact with firewall-cmd
    Puppet::Resource::Param(Any, 'provider')
  ],
  {
    /(?m-ix:(.*))/ => ['name']
  },
  true,
  false)
