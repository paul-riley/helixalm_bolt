# This file was automatically generated on 2024-05-02 14:20:28 -0600.
# Use the 'puppet generate types' command to regenerate this file.

# Allow to pass rules directly to iptables/ip6tables/ebtables using firewalld direct interface.
# 
# Example:
# 
#     firewalld_direct_rule {'Allow outgoing SSH connection':
#         ensure         => 'present',
#         inet_protocol  => 'ipv4',
#         table          => 'filter',
#         chain          => 'OUTPUT',
#         priority       => 1,
#         args           => '-p tcp --dport=22 -j ACCEPT',
#     }
Puppet::Resource::ResourceType3.new(
  'firewalld_direct_rule',
  [
    # Manage the state of this type.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure')
  ],
  [
    # Name of the rule resource in Puppet
    Puppet::Resource::Param(Any, 'name', true),

    # Name of the TCP/IP protocol to use (e.g: ipv4, ipv6, eb)
    # 
    # Valid values are `ipv4`, `ipv6`, `eb`.
    Puppet::Resource::Param(Enum['ipv4', 'ipv6', 'eb'], 'inet_protocol'),

    # Name of the table type to add (e.g: filter, nat, mangle, raw)
    Puppet::Resource::Param(Any, 'table'),

    # Name of the chain type to add (e.g: INPUT, OUTPUT, FORWARD)
    Puppet::Resource::Param(Any, 'chain'),

    # The priority number of the rule (e.g: 0, 1, 2, ... 99)
    Puppet::Resource::Param(Any, 'priority'),

    # <args> can be all iptables, ip6tables and ebtables command line arguments
    Puppet::Resource::Param(Any, 'args'),

    # The specific backend to use for this `firewalld_direct_rule`
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
