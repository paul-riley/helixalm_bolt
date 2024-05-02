# This file was automatically generated on 2024-05-02 14:20:28 -0600.
# Use the 'puppet generate types' command to regenerate this file.

# Allow to purge direct rules in iptables/ip6tables/ebtables using firewalld direct interface.
# 
# Example:
# 
#     firewalld_direct_purge {'chain': }
#     firewalld_direct_purge {'passthrough': }
#     firewalld_direct_purge {'rule': }
Puppet::Resource::ResourceType3.new(
  'firewalld_direct_purge',
  [
    # Manage the state of this type.
    # 
    # Valid values are `purgable`, `purged`.
    Puppet::Resource::Param(Enum['purgable', 'purged'], 'ensure')
  ],
  [
    # If unmaintained definitions should be purged
    # 
    # Valid values are `true`, `false`.
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'false']], 'purge'),

    # Type of resource to purge, valid values are 'chain', 'passthrough' and 'rule'
    # 
    # Valid values are `chain`, `passthrough`, `rule`.
    Puppet::Resource::Param(Enum['chain', 'passthrough', 'rule'], 'name', true),

    # The specific backend to use for this `firewalld_direct_purge`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # firewall_cmd
    # : Meta provider to the firewalld_direct_purge type
    Puppet::Resource::Param(Any, 'provider')
  ],
  {
    /(?m-ix:(.*))/ => ['name']
  },
  true,
  false)
