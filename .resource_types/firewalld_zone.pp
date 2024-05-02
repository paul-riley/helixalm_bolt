# This file was automatically generated on 2024-05-02 14:20:29 -0600.
# Use the 'puppet generate types' command to regenerate this file.

# @summary
#   Creates and manages firewalld zones.
# 
# Creates and manages firewalld zones.
# 
# Note that setting `ensure => 'absent'` to the built in firewalld zones will
# not work, and will generate an error. This is a limitation of firewalld itself, not the module.
# 
# @example Create a zone called `restricted` allowing only `echo-request` icmp types
#   firewalld_zone { 'restricted':
#     ensure               => present,
#     target               => '%%REJECT%%',
#     interfaces           => [],
#     sources              => [],
#     purge_rich_rules     => true,
#     purge_services       => true,
#     purge_ports          => true,
#     icmp_blocks          => 'echo-request'
#     icmp_block_inversion => true,
#   }
Puppet::Resource::ResourceType3.new(
  'firewalld_zone',
  [
    # Manage the state of this type.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # Specify the target for the zone
    Puppet::Resource::Param(Any, 'target'),

    # Specify the interfaces for the zone
    Puppet::Resource::Param(Any, 'interfaces'),

    # Can be set to true or false, specifies whether to add or remove masquerading from the zone
    # 
    # Valid values are `true`, `false`.
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'false']], 'masquerade'),

    # Specify the sources for the zone
    Puppet::Resource::Param(Any, 'sources'),

    # Specify the protocols for the zone
    Puppet::Resource::Param(Any, 'protocols'),

    # Specify the icmp-blocks for the zone. Can be a single string specifying one icmp type,
    # or an array of strings specifying multiple icmp types. Any blocks not specified here will be removed
    Puppet::Resource::Param(Any, 'icmp_blocks'),

    # Can be set to true or false, specifies whether to set icmp_block_inversion from the zone
    # 
    # Valid values are `true`, `false`.
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'false']], 'icmp_block_inversion'),

    # When set to true any rich_rules associated with this zone
    # that are not managed by Puppet will be removed.
    # 
    # Valid values are `false`, `true`.
    Puppet::Resource::Param(Variant[Boolean, Enum['false', 'true']], 'purge_rich_rules'),

    # When set to true any services associated with this zone
    # that are not managed by Puppet will be removed.
    # 
    # Valid values are `false`, `true`.
    Puppet::Resource::Param(Variant[Boolean, Enum['false', 'true']], 'purge_services'),

    # When set to true any ports associated with this zone
    # that are not managed by Puppet will be removed.
    # 
    # Valid values are `false`, `true`.
    Puppet::Resource::Param(Variant[Boolean, Enum['false', 'true']], 'purge_ports')
  ],
  [
    # Name of the rule resource in Puppet
    Puppet::Resource::Param(Any, 'name', true),

    # Name of the zone
    Puppet::Resource::Param(Any, 'zone'),

    # Description of the zone to add
    Puppet::Resource::Param(Any, 'description'),

    # Short description of the zone to add
    Puppet::Resource::Param(Any, 'short'),

    # The specific backend to use for this `firewalld_zone`
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
