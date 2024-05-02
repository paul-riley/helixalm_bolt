# This file was automatically generated on 2024-05-02 14:20:28 -0600.
# Use the 'puppet generate types' command to regenerate this file.

# @summary Creates a custom firewalld service.
# 
# 
# You will still need to create a `firewalld_service` resource to bind your new
# service to a zone.
# 
# @example Creating a custom 'test' service
#   firewalld_custom_service {'test':
#       ensure  => present,
#       ports   => [{'port' => '1234', 'protocol' => 'tcp'}]
#   }
Puppet::Resource::ResourceType3.new(
  'firewalld_custom_service',
  [
    # Manage the state of this type.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # The short description of the service
    # 
    # Values can match `/.+/`.
    Puppet::Resource::Param(Pattern[/.+/], 'short'),

    # The long description of the service
    # 
    # Values can match `/.+/`.
    Puppet::Resource::Param(Pattern[/.+/], 'description'),

    # An Array of allowed port/protocol Hashes or Strings of the form `port/protocol`
    Puppet::Resource::Param(Any, 'ports'),

    # Protocols allowed by the service as defined in /etc/protocols
    # 
    # Values can match `/^[^\s#]+$/`.
    Puppet::Resource::Param(Pattern[/^[^\s#]+$/], 'protocols'),

    # The list of netfilter modules to add to the service
    # 
    # Values can match `/^[\w-]+$/`.
    Puppet::Resource::Param(Pattern[/^[\w-]+$/], 'modules'),

    # The IPv4 destination network of the service
    Puppet::Resource::Param(Any, 'ipv4_destination'),

    # The IPv6 destination network of the service
    Puppet::Resource::Param(Any, 'ipv6_destination')
  ],
  [
    # The target filename of the resource (without the .xml suffix)
    # 
    # Values can match `/.+/`.
    Puppet::Resource::Param(Pattern[/.+/], 'name', true),

    # The specific backend to use for this `firewalld_custom_service`
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
