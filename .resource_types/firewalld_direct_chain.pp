# This file was automatically generated on 2024-05-02 14:20:28 -0600.
# Use the 'puppet generate types' command to regenerate this file.

# Allow to create a custom chain in iptables/ip6tables/ebtables using firewalld direct interface.
# 
# Example:
# 
#     firewalld_direct_chain {'Add custom chain LOG_DROPS':
#         name           => 'LOG_DROPS',
#         ensure         => 'present',
#         inet_protocol  => 'ipv4',
#         table          => 'filter'
#     }
Puppet::Resource::ResourceType3.new(
  'firewalld_direct_chain',
  [
    # Manage the state of this type.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure')
  ],
  [
    # Name of the chain eg: LOG_DROPS
    Puppet::Resource::Param(Any, 'name', true),

    # Name of the TCP/IP protocol to use (e.g: ipv4, ipv6, eb)
    # 
    # Valid values are `ipv4`, `ipv6`, `eb`.
    Puppet::Resource::Param(Enum['ipv4', 'ipv6', 'eb'], 'inet_protocol', true),

    # Name of the table type to add (e.g: filter, nat, mangle, raw)
    Puppet::Resource::Param(Any, 'table', true),

    # The specific backend to use for this `firewalld_direct_chain`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # firewall_cmd
    # : Provider for managing firewalld direct chains using firewall-cmd
    Puppet::Resource::Param(Any, 'provider')
  ],
  {
    /^([^:]+):([^:]+):([^:]+)$/ => ['inet_protocol', 'table', 'name'],
    /^([^:]+)$/ => ['name']
  },
  true,
  false)
