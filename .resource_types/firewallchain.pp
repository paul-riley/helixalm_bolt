# This file was automatically generated on 2024-05-02 14:20:28 -0600.
# Use the 'puppet generate types' command to regenerate this file.

# This type provides the capability to manage rule chains for firewalls.
# 
# Currently this supports only iptables, ip6tables and ebtables on Linux. And
# provides support for setting the default policy on chains and tables that
# allow it.
# 
# #### Providers
#   * iptables_chain is the only provider that supports firewallchain.
# 
# #### Features
#   * iptables_chain: The provider provides iptables chain features.
#   * policy: Default policy (inbuilt chains only).
Puppet::Resource::ResourceType3.new(
  'firewallchain',
  [
    # Whether this chain should be present or absent on the target system.
    #      Setting this to absent will first remove all rules associated with this chain and then delete the chain itself.
    #      Inbuilt chains however will merely remove any added rules and, if it has been changed, return their policy to the default.
    # (a Enum[present, absent])
    # 
    # Valid values are `absent`, `present`.
    Puppet::Resource::Param(Enum['absent', 'present'], 'ensure'),

    # This action to take when the end of the chain is reached.
    #      This can only be set on inbuilt chains (i.e. INPUT, FORWARD, OUTPUT,
    #      PREROUTING, POSTROUTING) and can be one of:
    # 
    #      * accept - the packet is accepted
    #      * drop - the packet is dropped
    #      * queue - the packet is passed userspace
    #      * return - the packet is returned to calling (jump) queue
    #                 or the default of inbuilt chains
    # (a Optional[Enum['accept', 'drop', 'queue', 'return']])
    Puppet::Resource::Param(Any, 'policy'),

    # Whether or not to purge unmanaged rules in this chain (a Boolean)
    # 
    # Valid values are `true` (also called `true, true`), `false` (also called `false, false`).
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'true', 'true', 'false', 'false', 'false']], 'purge'),

    # Regex to perform on firewall rules to exempt unmanaged rules from purging.
    #      This is matched against the output of `iptables-save`.
    # 
    #      This can be a single regex, or an array of them.
    #      To support flags, use the ruby inline flag mechanism.
    #      Meaning a regex such as
    #        /foo/i
    #      can be written as
    #        '(?i)foo' or '(?i:foo)'
    # 
    #      Full example:
    #      ```
    #      firewallchain { 'INPUT:filter:IPv4':
    #        purge => true,
    #        ignore => [
    #          '-j fail2ban-ssh', # ignore the fail2ban jump rule
    #          '--comment "[^"]*(?i:ignore)[^"]*"', # ignore any rules with "ignore" (case insensitive) in the comment in the rule
    #        ],
    #      }
    #      ```
    # (a Optional[Variant[String[1], Array[String[1]]]])
    Puppet::Resource::Param(Any, 'ignore'),

    # Ignore rules that do not match the puppet title pattern "^d+[[:graph:][:space:]]" when purging unmanaged firewall rules in this chain.
    #      This can be used to ignore rules that were not put in by puppet. Beware that nothing keeps other systems from configuring firewall rules with a comment that starts with digits, and is indistinguishable from puppet-configured rules.
    # (a Boolean)
    # 
    # Valid values are `true` (also called `true, true`), `false` (also called `false, false`).
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'true', 'true', 'false', 'false', 'false']], 'ignore_foreign')
  ],
  [
    # The canonical name of the chain with the required format being `{chain}:{table}:{protocol}`. (a Pattern[/^(?:\S+):(?:nat|mangle|filter|raw|rawpost|broute|security):(?:IP(?:v[46])?|ethernet)$/])
    Puppet::Resource::Param(Any, 'name', true)
  ],
  {
    /(?m-ix:(.*))/ => ['name']
  },
  true,
  false)
