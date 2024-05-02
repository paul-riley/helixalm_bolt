# This file was automatically generated on 2024-05-02 14:20:29 -0600.
# Use the 'puppet generate types' command to regenerate this file.

# @summary
#   Creates and manages firewalld policies.
# 
# Creates and manages firewalld policies.
# 
# Note that setting `ensure => 'absent'` to the built in firewalld
# policies will not work, and will generate an error. This is a
# limitation of firewalld itself, not the module.
# 
# @example Create a policy called `anytorestricted`
#   firewalld_policy { 'anytorestricted':
#     ensure           => present,
#     target           => '%%REJECT%%',
#     ingress_zones    => ['ANY'],
#     egress_zones     => ['restricted'],
#     purge_rich_rules => true,
#     purge_services   => true,
#     purge_ports      => true,
#     icmp_blocks      => 'router-advertisement'
#   }
Puppet::Resource::ResourceType3.new(
  'firewalld_policy',
  [
    # Manage the state of this type.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # Specify the target for the policy
    Puppet::Resource::Param(Any, 'target'),

    # Specify the ingress zones for the policy as an array of strings
    Puppet::Resource::Param(Any, 'ingress_zones'),

    # Specify the egress zones for the policy as an array of strings
    Puppet::Resource::Param(Any, 'egress_zones'),

    # The priority of the policy as an integer (default -1)
    Puppet::Resource::Param(Any, 'priority'),

    # Can be set to true or false, specifies whether to add or remove masquerading from the policy
    # 
    # Valid values are `true`, `false`.
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'false']], 'masquerade'),

    # Specify the icmp-blocks for the policy. Can be a single string specifying one icmp type,
    # or an array of strings specifying multiple icmp types. Any blocks not specified here will be removed
    Puppet::Resource::Param(Any, 'icmp_blocks'),

    # When set to true any rich_rules associated with this policy
    # that are not managed by Puppet will be removed.
    # 
    # Valid values are `false`, `true`.
    Puppet::Resource::Param(Variant[Boolean, Enum['false', 'true']], 'purge_rich_rules'),

    # When set to true any services associated with this policy
    # that are not managed by Puppet will be removed.
    # 
    # Valid values are `false`, `true`.
    Puppet::Resource::Param(Variant[Boolean, Enum['false', 'true']], 'purge_services'),

    # When set to true any ports associated with this policy
    # that are not managed by Puppet will be removed.
    # 
    # Valid values are `false`, `true`.
    Puppet::Resource::Param(Variant[Boolean, Enum['false', 'true']], 'purge_ports')
  ],
  [
    # Name of the rule resource in Puppet
    Puppet::Resource::Param(Any, 'name', true),

    # Name of the policy
    Puppet::Resource::Param(Any, 'policy'),

    # Description of the policy to add
    Puppet::Resource::Param(Any, 'description'),

    # Short description of the policy to add
    Puppet::Resource::Param(Any, 'short'),

    # The specific backend to use for this `firewalld_policy`
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
