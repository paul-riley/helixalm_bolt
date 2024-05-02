# This file was automatically generated on 2024-05-02 14:20:29 -0600.
# Use the 'puppet generate types' command to regenerate this file.

# Assigns a port to a specific firewalld zone.
# 
# firewalld_port will autorequire the firewalld_zone specified in
# the zone parameter or the firewalld_policy specified in the policy
# parameter so there is no need to add dependencies for this
# 
# Example:
# 
#     firewalld_port {'Open port 8080 in the public Zone':
#         ensure   => 'present',
#         zone     => 'public',
#         port     => 8080,
#         protocol => 'tcp',
#     }
Puppet::Resource::ResourceType3.new(
  'firewalld_port',
  [
    # Manage the state of this type.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure')
  ],
  [
    # Name of the port resource in Puppet
    Puppet::Resource::Param(Any, 'name', true),

    # Name of the zone to which you want to add the port, exactly one of zone and policy must be supplied
    Puppet::Resource::Param(Any, 'zone'),

    # Name of the policy to which you want to add the port, exactly one of zone and policy must be supplied
    Puppet::Resource::Param(Any, 'policy'),

    # Specify the element as a port
    Puppet::Resource::Param(Any, 'port'),

    # Specify the element as a protocol
    Puppet::Resource::Param(Any, 'protocol'),

    # The specific backend to use for this `firewalld_port`
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
