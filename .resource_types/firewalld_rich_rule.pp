# This file was automatically generated on 2024-05-02 14:20:29 -0600.
# Use the 'puppet generate types' command to regenerate this file.

# Manages firewalld rich rules.
# 
# firewalld_rich_rules will autorequire the firewalld_zone specified
# in the zone parameter or the firewalld_policy specified in the
# policy parameter so there is no need to add dependencies for this
# 
# Example:
# 
#   firewalld_rich_rule { 'Accept SSH from barny':
#     ensure => present,
#     zone   => 'restricted',
#     source => '192.168.1.2/32',
#     service => 'ssh',
#     action  => 'accept',
#   }
Puppet::Resource::ResourceType3.new(
  'firewalld_rich_rule',
  [
    # Manage the state of this type.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure')
  ],
  [
    # Name of the rule resource in Puppet
    Puppet::Resource::Param(Any, 'name', true),

    # Name of the zone to attach the rich rule to, exactly one of zone and policy must be supplied
    Puppet::Resource::Param(Any, 'zone'),

    # Name of the policy to attach the rich rule to, exactly one of zone and policy must be supplied
    Puppet::Resource::Param(Any, 'policy'),

    # IP family, one of ipv4, ipv6 or eb, defauts to ipv4
    # 
    # Valid values are `ipv4`, `ipv6`, `eb`.
    Puppet::Resource::Param(Enum['ipv4', 'ipv6', 'eb'], 'family'),

    # Rule priority, it can be in the range of -32768 to 32767
    Puppet::Resource::Param(Any, 'priority'),

    # Specify source address, this can be a string of the IP address or a hash containing other options
    Puppet::Resource::Param(Any, 'source'),

    # Specify destination address, this can be a string of the IP address or a hash containing other options
    Puppet::Resource::Param(Any, 'dest'),

    # Specify the element as a service
    Puppet::Resource::Param(Any, 'service'),

    # Specify the element as a port
    Puppet::Resource::Param(Any, 'port'),

    # Specify the element as a protocol
    Puppet::Resource::Param(Any, 'protocol'),

    # Specify the element as an icmp-block
    Puppet::Resource::Param(Any, 'icmp_block'),

    # Specify the element as an icmp-type
    Puppet::Resource::Param(Any, 'icmp_type'),

    # Specify the element as masquerade
    Puppet::Resource::Param(Any, 'masquerade'),

    # Specify the element as forward-port
    Puppet::Resource::Param(Any, 'forward_port'),

    # doc
    Puppet::Resource::Param(Any, 'log'),

    # doc
    Puppet::Resource::Param(Any, 'audit'),

    # Specify the action fo this rule
    Puppet::Resource::Param(Any, 'action'),

    # Manage the entire rule as one string - this is used
    # internally by firwalld_zone and firewalld_policy to handle
    # pruning of rules
    Puppet::Resource::Param(Any, 'raw_rule'),

    # The specific backend to use for this `firewalld_rich_rule`
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
