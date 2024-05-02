# This file was automatically generated on 2024-05-02 14:20:28 -0600.
# Use the 'puppet generate types' command to regenerate this file.

# Configure IPsets in Firewalld
# 
# Example:
#     firewalld_ipset {'internal net':
#         ensure   => 'present',
#         type     => 'hash:net',
#         family   => 'inet',
#         entries  => ['192.168.0.0/24']
#     }
Puppet::Resource::ResourceType3.new(
  'firewalld_ipset',
  [
    # Manage the state of this type.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # Array of ipset entries
    Puppet::Resource::Param(Any, 'entries'),

    # Protocol family of the IPSet
    # 
    # Valid values are `inet6`, `inet`.
    Puppet::Resource::Param(Enum['inet6', 'inet'], 'family'),

    # Initial hash size of the IPSet
    Puppet::Resource::Param(Any, 'hashsize'),

    # Maximal number of elements that can be stored in the set
    # 
    # Values can match `/^[1-9]\d*$/`.
    Puppet::Resource::Param(Pattern[/^[1-9]\d*$/], 'maxelem'),

    # Timeout in seconds before entries expiry. 0 means entry is permanent
    # 
    # Values can match `/^\d+$/`.
    Puppet::Resource::Param(Pattern[/^\d+$/], 'timeout')
  ],
  [
    # Name of the IPset
    Puppet::Resource::Param(Any, 'name', true),

    # Type of the ipset (default: hash:ip)
    # 
    # Valid values are `bitmap:ip`, `bitmap:ip,mac`, `bitmap:port`, `hash:ip`, `hash:ip,mark`, `hash:ip,port`, `hash:ip,port,ip`, `hash:ip,port,net`, `hash:mac`, `hash:net`, `hash:net,iface`, `hash:net,net`, `hash:net,port`, `hash:net,port,net`, `list:set`.
    Puppet::Resource::Param(Enum['bitmap:ip', 'bitmap:ip,mac', 'bitmap:port', 'hash:ip', 'hash:ip,mark', 'hash:ip,port', 'hash:ip,port,ip', 'hash:ip,port,net', 'hash:mac', 'hash:net', 'hash:net,iface', 'hash:net,net', 'hash:net,port', 'hash:net,port,net', 'list:set'], 'type'),

    # Hash of options for the IPset, eg { 'family' => 'inet6' }
    Puppet::Resource::Param(Any, 'options'),

    # Should we manage entries in this ipset or leave another process manage those entries
    # 
    # Valid values are `true`, `false`, `yes`, `no`.
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'false', 'yes', 'no']], 'manage_entries'),

    # The specific backend to use for this `firewalld_ipset`
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
