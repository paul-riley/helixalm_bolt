# This file was automatically generated on 2024-05-02 14:20:28 -0600.
# Use the 'puppet generate types' command to regenerate this file.

# Allow to create a custom passthroughhrough traffic in iptables/ip6tables/ebtables using firewalld direct interface.
# 
# Example:
# 
#     firewalld_direct_passthrough {'Forward traffic from OUTPUT to OUTPUT_filter':
#         ensure        => 'present',
#         inet_protocol => 'ipv4',
#         args          => '-A OUTPUT -j OUTPUT_filter',
#     }
# 
# Or using namevar
# 
#     firewalld_direct_passthrough {'-A OUTPUT -j OUTPUT_filter':
#         ensure        => 'present',
#     }
Puppet::Resource::ResourceType3.new(
  'firewalld_direct_passthrough',
  [
    # Manage the state of this type.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure')
  ],
  [
    # Name of the TCP/IP protocol to use (e.g: ipv4, ipv6, eb)
    # 
    # Valid values are `ipv4`, `ipv6`, `eb`.
    Puppet::Resource::Param(Enum['ipv4', 'ipv6', 'eb'], 'inet_protocol'),

    # Name of the passthroughhrough to add (e.g: -A OUTPUT -j OUTPUT_filter)
    Puppet::Resource::Param(Any, 'args', true),

    # The specific backend to use for this `firewalld_direct_passthrough`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # firewalld_cmd
    # : Interact with firewall-cmd
    Puppet::Resource::Param(Any, 'provider')
  ],
  {
    /(?m-ix:(.*))/ => ['args']
  },
  true,
  false)
