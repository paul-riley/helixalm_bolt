# This file was automatically generated on 2024-05-02 14:20:28 -0600.
# Use the 'puppet generate types' command to regenerate this file.

# This type provides the capability to manage firewall rules within puppet via iptables.
# 
# **Autorequires:**
# 
# If Puppet is managing the iptables chains specified in the
# `chain` or `jump` parameters, the firewall resource will autorequire
# those firewallchain resources.
# 
# If Puppet is managing the iptables, iptables-persistent, or iptables-services packages,
# the firewall resource will autorequire those packages to ensure that any required binaries are
# installed.
# 
# #### Providers
#     * Required binaries: iptables-save, iptables.
#     * Default for kernel == linux.
#     * Supported features: address_type, clusterip, connection_limiting, conntrack, dnat, icmp_match,
#     interface_match, iprange, ipsec_dir, ipsec_policy, ipset, iptables, isfragment, length,
#     log_level, log_prefix, log_uid, log_tcp_sequence, log_tcp_options, log_ip_options,
#     mark, mask, mss, netmap, nflog_group, nflog_prefix,
#     nflog_range, nflog_threshold, owner, pkttype, queue_bypass, queue_num, rate_limiting,
#     recent_limiting, reject_type, snat, socket, state_match, string_matching, tcp_flags, bpf.
# 
# #### Features
#   * address_type: The ability to match on source or destination address type.
# 
#   * clusterip: Configure a simple cluster of nodes that share a certain IP and MAC address without an explicit load balancer in front of them.
# 
#   * condition: Match if a specific condition variable is (un)set (requires xtables-addons)
# 
#   * connection_limiting: Connection limiting features.
# 
#   * conntrack: Connection tracking features.
# 
#   * dnat: Destination NATing.
# 
#   * hop_limiting: Hop limiting features.
# 
#   * icmp_match: The ability to match ICMP types.
# 
#   * interface_match: Interface matching.
# 
#   * iprange: The ability to match on source or destination IP range.
# 
#   * ipsec_dir: The ability to match IPsec policy direction.
# 
#   * ipsec_policy: The ability to match IPsec policy.
# 
#   * iptables: The provider provides iptables features.
# 
#   * isfirstfrag: The ability to match the first fragment of a fragmented ipv6 packet.
# 
#   * isfragment: The ability to match fragments.
# 
#   * ishasmorefrags: The ability to match a non-last fragment of a fragmented ipv6 packet.
# 
#   * islastfrag: The ability to match the last fragment of an ipv6 packet.
# 
#   * length: The ability to match the length of the layer-3 payload.
# 
#   * log_level: The ability to control the log level.
# 
#   * log_prefix: The ability to add prefixes to log messages.
# 
#   * log_uid: The ability to log the userid of the process which generated the packet.
# 
#   * log_tcp_sequence: The ability to log TCP sequence numbers.
# 
#   * log_tcp_options: The ability to log TCP packet header.
# 
#   * log_ip_options: The ability to log IP/IPv6 packet header.
# 
#   * mark: The ability to match or set the netfilter mark value associated with the packet.
# 
#   * mask: The ability to match recent rules based on the ipv4 mask.
# 
#   * nflog_group: The ability to set the group number for NFLOG.
# 
#   * nflog_prefix: The ability to set a prefix for nflog messages.
# 
#   * nflog_size: Set the max size of a message to send to nflog.
# 
#   * nflog_threshold: The ability to set nflog_threshold.
# 
#   * owner: The ability to match owners.
# 
#   * pkttype: The ability to match a packet type.
# 
#   * rate_limiting: Rate limiting features.
# 
#   * recent_limiting: The netfilter recent module.
# 
#   * reject_type: The ability to control reject messages.
# 
#   * set_mss: Set the TCP MSS of a packet.
# 
#   * snat: Source NATing.
# 
#   * socket: The ability to match open sockets.
# 
#   * state_match: The ability to match stateful firewall states.
# 
#   * string_matching: The ability to match a given string by using some pattern matching strategy.
# 
#   * tcp_flags: The ability to match on particular TCP flag settings.
# 
#   * netmap: The ability to map entire subnets via source or destination nat rules.
# 
#   * hashlimit: The ability to use the hashlimit-module.
# 
#   * bpf: The ability to use Berkeley Paket Filter rules.
# 
#   * ipvs: The ability to match IP Virtual Server packets.
# 
#   * ct_target: The ability to set connection tracking parameters for a packet or its associated connection.
# 
#   * random_fully: The ability to use --random-fully flag.
Puppet::Resource::ResourceType3.new(
  'firewall',
  [
    # Whether this rule should be present or absent on the target system.
    # (a Enum[present, absent, 'present', 'absent'])
    Puppet::Resource::Param(Any, 'ensure'),

    # The protocol used to set the rule, it's allowed values have been expanded to bring it closer to its `firewallchain` counterpart.
    #      Defaults to `IPv4`
    # 
    #      Noted: this was previously defined as `provider`, however the resource_api does not allow this to be used as an attribute title.
    # (a Enum['iptables', 'ip6tables', 'IPv4', 'IPv6'])
    Puppet::Resource::Param(Any, 'protocol'),

    # The table the rule will exist in.
    #      Valid options are:
    # 
    #      * nat
    #      * mangle
    #      * filter
    #      * raw
    #      * rawpost
    # 
    #      Defaults to 'filter'
    # (a Enum['nat', 'mangle', 'filter', 'raw', 'rawpost', 'broute', 'security'])
    Puppet::Resource::Param(Any, 'table'),

    # Name of the chain the rule will be a part of, ensure the chain you choose exists within your set table.
    #      Can be one of the built-in chains:
    # 
    #      * INPUT
    #      * FORWARD
    #      * OUTPUT
    #      * PREROUTING
    #      * POSTROUTING
    # 
    #      Or you can provide a user-based chain.
    #      Defaults to 'INPUT'
    # (a String[1])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'chain'),

    # The source address. For example:
    # 
    #          source => '192.168.2.0/24'
    # 
    #      You can also negate a mask by putting ! in front. For example:
    # 
    #          source => '! 192.168.2.0/24'
    # 
    #      The source can also be an IPv6 address if your provider supports it.
    # (a Optional[String[1]])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'source'),

    # The destination address to match. For example:
    # 
    #          destination => '192.168.1.0/24'
    # 
    #      You can also negate a mask by putting ! in front. For example:
    # 
    #          destination  => '! 192.168.2.0/24'
    # 
    #      The destination can also be an IPv6 address if your provider supports it.
    # (a Optional[String[1]])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'destination'),

    # Input interface to filter on.  Supports interface alias like eth0:0.
    #      To negate the match try this:
    # 
    #            iniface => '! lo',
    # (a Optional[Pattern[/^(?:!\s)?[a-zA-Z0-9\-\._\+\:@]+$/]])
    Puppet::Resource::Param(Any, 'iniface'),

    # Output interface to filter on.  Supports interface alias like eth0:0.
    #      To negate the match try this:
    # 
    #            outiface => '! lo',
    # (a Optional[Pattern[/^(?:!\s)?[a-zA-Z0-9\-\._\+\:@]+$/]])
    Puppet::Resource::Param(Any, 'outiface'),

    # Match if the packet is entering a bridge from the given interface.
    #      To negate the match try this:
    # 
    #          physdev_in => '! lo',
    # (a Optional[Pattern[/^(?:!\s)?[a-zA-Z0-9\-\._\+]+$/]])
    Puppet::Resource::Param(Any, 'physdev_in'),

    # Match if the packet is leaving a bridge via the given interface.
    #      To negate the match try this:
    # 
    #          physdev_out => '! lo',
    # (a Optional[Pattern[/^(?:!\s)?[a-zA-Z0-9\-\._\+]+$/]])
    Puppet::Resource::Param(Any, 'physdev_out'),

    # Match if the packet is transversing a bridge.
    # (a Optional[Boolean])
    # 
    # Valid values are `true` (also called `true, true`), `false` (also called `false, false`).
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'true', 'true', 'false', 'false', 'false']], 'physdev_is_bridged'),

    # Matches if the packet has entered through a bridge interface.
    # (a Optional[Boolean])
    # 
    # Valid values are `true` (also called `true, true`), `false` (also called `false, false`).
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'true', 'true', 'false', 'false', 'false']], 'physdev_is_in'),

    # Matches if the packet will leave through a bridge interface.
    # (a Optional[Boolean])
    # 
    # Valid values are `true` (also called `true, true`), `false` (also called `false, false`).
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'true', 'true', 'false', 'false', 'false']], 'physdev_is_out'),

    # The specific protocol to match for this rule.
    # (a Optional[Pattern[/^(?:!\s)?(?:ip(?:encap)?|tcp|udp|icmp|esp|ah|vrrp|carp|igmp|ipv4|ospf|gre|cbt|sctp|pim|all)/]])
    Puppet::Resource::Param(Any, 'proto'),

    # Set to true to match tcp fragments (requires proto to be set to tcp)
    # (a Optional[Boolean])
    # 
    # Valid values are `true` (also called `true, true`), `false` (also called `false, false`).
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'true', 'true', 'false', 'false', 'false']], 'isfragment'),

    # Matches if the packet is the first fragment.
    #      Specific to IPv6.
    # (a Optional[Boolean])
    # 
    # Valid values are `true` (also called `true, true`), `false` (also called `false, false`).
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'true', 'true', 'false', 'false', 'false']], 'isfirstfrag'),

    # Matches if the packet has it's 'more fragments' bit set.
    #      Specific to IPv6.
    # (a Optional[Boolean])
    # 
    # Valid values are `true` (also called `true, true`), `false` (also called `false, false`).
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'true', 'true', 'false', 'false', 'false']], 'ishasmorefrags'),

    # Matches if the packet is the last fragment.
    #      Specific to IPv6.
    # (a Optional[Boolean])
    # 
    # Valid values are `true` (also called `true, true`), `false` (also called `false, false`).
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'true', 'true', 'false', 'false', 'false']], 'islastfrag'),

    # Set the matching mode for statistic matching.
    # (a Optional[Enum[nth, random]])
    Puppet::Resource::Param(Any, 'stat_mode'),

    # Match one packet every nth packet. Requires `stat_mode => 'nth'`
    # (a Optional[Integer[1]])
    # 
    # Values can match `/^-?\d+$/`.
    Puppet::Resource::Param(Pattern[/^-?\d+$/], 'stat_every'),

    # Set the initial counter value for the nth mode. Must be between 0 and the value of `stat_every`.
    #      Defaults to 0. Requires `stat_mode => 'nth'`
    # (a Optional[Integer])
    # 
    # Values can match `/^-?\d+$/`.
    Puppet::Resource::Param(Pattern[/^-?\d+$/], 'stat_packet'),

    # Set the probability from 0 to 1 for a packet to be randomly matched. It works only with `stat_mode => 'random'`.
    # (a Optional[Variant[Integer[0,1], Float[0.0,1.0]]])
    Puppet::Resource::Param(Any, 'stat_probability'),

    # The source IP range. For example:
    # 
    #          src_range => '192.168.1.1-192.168.1.10'
    # 
    #      You can also negate the range by apending a `!`` to the front. For example:
    # 
    #          src_range => '! 192.168.1.1-192.168.1.10'
    # 
    #      The source IP range must be in 'IP1-IP2' format.
    # (a Optional[String[1]])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'src_range'),

    # The destination IP range. For example:
    # 
    #          dst_range => '192.168.1.1-192.168.1.10'
    # 
    #      You can also negate the range by putting ! in front. For example:
    # 
    #          dst_range => '! 192.168.1.1-192.168.1.10'
    # 
    #      The destination IP range must be in 'IP1-IP2' format.
    # (a Optional[String[1]])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'dst_range'),

    # Match when the TCP option is present or absent.
    #      Given as a single TCP option, optionally prefixed with '! ' to match
    #      on absence instead.  Only one TCP option can be matched in a given rule.
    #      TCP option numbers are an eight-bit field, so valid option numbers range
    #      from 0-255.
    # (a Optional[Variant[Pattern[/^(?:!\s)?(?:[0-1][0-9]{0,2}|2[0-4][0-9]|25[0-5])$/], Integer[0,255]]])
    Puppet::Resource::Param(Any, 'tcp_option'),

    # Match when the TCP flags are as specified.
    #      Is a string with a list of comma-separated flag names for the mask,
    #      then a space, then a comma-separated list of flags that should be set.
    #      The flags are: FIN SYN RST PSH ACK URG ALL NONE
    #      Note that you specify them in the order that iptables --list-rules
    #      would list them to avoid having puppet think you changed the flags.
    # 
    #      Example: FIN,SYN,RST,ACK SYN matches packets with the SYN bit set and the
    #      ACK,RST and FIN bits cleared. Such packets are used to request
    #      TCP  connection initiation.
    #      Can be negated by placing ! in front, i.e.
    #        ! FIN,SYN,RST,ACK SYN
    # (a Optional[Pattern[/^(?:!\s)?((FIN|SYN|RST|PSH|ACK|URG|ALL|NONE),?)+\s((FIN|SYN|RST|PSH|ACK|URG|ALL|NONE),?)+$/]])
    Puppet::Resource::Param(Any, 'tcp_flags'),

    # UID or Username owner matching rule.  Accepts a single argument
    #      only, as iptables does not accept multiple uid in a single
    #      statement.
    #      To negate add a space seperated '!' in front of the value.
    # (a Optional[Variant[String[1], Integer]])
    Puppet::Resource::Param(Any, 'uid'),

    # GID or Group owner matching rule.  Accepts a single argument
    #      only, as iptables does not accept multiple gid in a single
    #      statement.
    #      To negate add a space seperated '!' in front of the value.
    # (a Optional[Variant[String[1], Integer]])
    Puppet::Resource::Param(Any, 'gid'),

    # MAC Source
    # (a Optional[Pattern[/^(?:!\s)?([0-9a-fA-F]{2}[:]){5}([0-9a-fA-F]{2})$/]])
    Puppet::Resource::Param(Any, 'mac_source'),

    # The source port to match for this filter (if the protocol supports
    #      ports). Will accept a single element or an array.
    # 
    #      For some firewall providers you can pass a range of ports in the format:
    # 
    #          sport => '1:1024'
    # 
    #      This would cover ports 1 to 1024.
    # 
    #      You can also negate a port by putting ! in front. For example:
    # 
    #          sport => '! 54'
    # 
    #      If you wish to negate multiple ports at once, then place a ! at the start of the first array
    #      variable. For example:
    # 
    #          sport => ['! 54','23']
    # 
    #      Note:
    #        This will negate all passed ports, it is not possible to negate a single one of the array.
    #        In order to maintain compatibility it is also possible to negate all values given in the array to achieve the same behaviour.
    # (a Optional[Variant[Array[Variant[Pattern[/^(?:!\s)?\d+(?:(?:\:|-)\d+)?$/],Integer]],Pattern[/^(?:!\s)?\d+(?:(?:\:|-)\d+)?$/],Integer]])
    Puppet::Resource::Param(Any, 'sport'),

    # The source port to match for this filter (if the protocol supports
    #      ports). Will accept a single element or an array.
    # 
    #      For some firewall providers you can pass a range of ports in the format:
    # 
    #          dport => '1:1024'
    # 
    #      This would cover ports 1 to 1024.
    # 
    #      You can also negate a port by putting ! in front. For example:
    # 
    #          dport => '! 54'
    # 
    #      If you wish to negate multiple ports at once, then place a ! at the start of the first array
    #      variable. For example:
    # 
    #          dport => ['! 54','23']
    # 
    #      Note:
    #        This will negate all passed ports, it is not possible to negate a single one of the array.
    #        In order to maintain compatibility it is also possible to negate all values given in the array to achieve the same behaviour.
    # (a Optional[Variant[Array[Variant[Pattern[/^(?:!\s)?\d+(?:(?:\:|-)\d+)?$/],Integer]],Pattern[/^(?:!\s)?\d+(?:(?:\:|-)\d+)?$/],Integer]])
    Puppet::Resource::Param(Any, 'dport'),

    # The source address type. For example:
    # 
    #          src_type => 'LOCAL'
    # 
    #      Can be one of:
    # 
    #      * UNSPEC - an unspecified address
    #      * UNICAST - a unicast address
    #      * LOCAL - a local address
    #      * BROADCAST - a broadcast address
    #      * ANYCAST - an anycast packet
    #      * MULTICAST - a multicast address
    #      * BLACKHOLE - a blackhole address
    #      * UNREACHABLE - an unreachable address
    #      * PROHIBIT - a prohibited address
    #      * THROW - undocumented
    #      * NAT - undocumented
    #      * XRESOLVE - undocumented
    # 
    #      In addition, it accepts '--limit-iface-in' and '--limit-iface-out' flags, specified as:
    # 
    #          src_type => ['LOCAL --limit-iface-in']
    # 
    #      It can also be negated using '!':
    # 
    #          src_type => ['! LOCAL']
    # 
    #      Will accept a single element or an array. Each element of the array should be negated seperately.
    # (a Optional[Variant[
    #             Array[Pattern[/^(?:!\s)?(?:UNSPEC|UNICAST|LOCAL|BROADCAST|ANYCAST|MULTICAST|BLACKHOLE|UNREACHABLE|UNREACHABLE|PROHIBIT|THROW|NAT|XRESOLVE)(?:\s--limit-iface-(?:in|out))?$/]],
    #             Pattern[/^(?:!\s)?(?:UNSPEC|UNICAST|LOCAL|BROADCAST|ANYCAST|MULTICAST|BLACKHOLE|UNREACHABLE|UNREACHABLE|PROHIBIT|THROW|NAT|XRESOLVE)(?:\s--limit-iface-(?:in|out))?$/]]])
    Puppet::Resource::Param(Any, 'src_type'),

    # The destination address type. For example:
    # 
    #          dst_type => ['LOCAL']
    # 
    #      Can be one of:
    # 
    #      * UNSPEC - an unspecified address
    #      * UNICAST - a unicast address
    #      * LOCAL - a local address
    #      * BROADCAST - a broadcast address
    #      * ANYCAST - an anycast packet
    #      * MULTICAST - a multicast address
    #      * BLACKHOLE - a blackhole address
    #      * UNREACHABLE - an unreachable address
    #      * PROHIBIT - a prohibited address
    #      * THROW - undocumented
    #      * NAT - undocumented
    #      * XRESOLVE - undocumented
    # 
    #      In addition, it accepts '--limit-iface-in' and '--limit-iface-out' flags, specified as:
    # 
    #          dst_type => ['LOCAL --limit-iface-in']
    # 
    #      Each value can be negated seperately using '!':
    # 
    #          dst_type => ['! UNICAST', '! LOCAL']
    # 
    #      Will accept a single element or an array.
    # (a Optional[Variant[
    #             Array[Pattern[/^(?:!\s)?(?:UNSPEC|UNICAST|LOCAL|BROADCAST|ANYCAST|MULTICAST|BLACKHOLE|UNREACHABLE|UNREACHABLE|PROHIBIT|THROW|NAT|XRESOLVE)(?:\s--limit-iface-(?:in|out))?$/]],
    #             Pattern[/^(?:!\s)?(?:UNSPEC|UNICAST|LOCAL|BROADCAST|ANYCAST|MULTICAST|BLACKHOLE|UNREACHABLE|UNREACHABLE|PROHIBIT|THROW|NAT|XRESOLVE)(?:\s--limit-iface-(?:in|out))?$/]]])
    Puppet::Resource::Param(Any, 'dst_type'),

    # If true, matches if an open socket can be found by doing a coket lookup
    #      on the packet.
    # (a Optional[Boolean])
    # 
    # Valid values are `true` (also called `true, true`), `false` (also called `false, false`).
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'true', 'true', 'false', 'false', 'false']], 'socket'),

    # Sets the packet type to match.
    # (a Optional[Enum['unicast', 'broadcast', 'multicast']])
    Puppet::Resource::Param(Any, 'pkttype'),

    # Sets the ipsec policy direction
    # (a Optional[Enum['in', 'out']])
    Puppet::Resource::Param(Any, 'ipsec_dir'),

    # Sets the ipsec policy type. May take a combination of arguments for any flags that can be passed to `--pol ipsec` such as: `--strict`, `--reqid 100`, `--next`, `--proto esp`, etc.
    # (a Optional[Enum['none', 'ipsec']])
    Puppet::Resource::Param(Any, 'ipsec_policy'),

    # Matches a packet based on its state in the firewall stateful inspection
    #      table. Values can be:
    # 
    #      * INVALID
    #      * ESTABLISHED
    #      * NEW
    #      * RELATED
    #      * UNTRACKED
    #      * SNAT
    #      * DNAT
    # 
    #      Can be passed either as a single String or as an Array:
    # 
    #          state => 'INVALID'
    #          state => ['INVALID', 'ESTABLISHED']
    # 
    #      Values can be negated by adding a '!'.
    #      If you wish to negate multiple states at once, then place a ! at the start of the first array
    #      variable. For example:
    # 
    #          state => ['! INVALID', 'ESTABLISHED']
    # 
    #      Note:
    #        This will negate all passed states, it is not possible to negate a single one of the array.
    #        In order to maintain compatibility it is also possible to negate all values given in the array to achieve the same behaviour.
    # (a Optional[Variant[Pattern[/^(?:!\s)?(?:INVALID|ESTABLISHED|NEW|RELATED|UNTRACKED)$/], Array[Pattern[/^(?:!\s)?(?:INVALID|ESTABLISHED|NEW|RELATED|UNTRACKED)$/]]]])
    Puppet::Resource::Param(Any, 'state'),

    # Matches a packet based on its state in the firewall stateful inspection
    #      table, using the conntrack module. Values can be:
    # 
    #      * INVALID
    #      * ESTABLISHED
    #      * NEW
    #      * RELATED
    #      * UNTRACKED
    #      * SNAT
    #      * DNAT
    # 
    #      Can be passed either as a single String or as an Array, if passed as an array values should be passed in order:
    # 
    #          ctstate => 'INVALID'
    #          ctstate => ['INVALID', 'ESTABLISHED']
    # 
    #      Values can be negated by adding a '!'.
    #      If you wish to negate multiple states at once, then place a ! at the start of the first array
    #      variable. For example:
    # 
    #      ctstate => ['! INVALID', 'ESTABLISHED']
    # 
    #      Note:
    #        This will negate all passed states, it is not possible to negate a single one of the array.
    #        In order to maintain compatibility it is also possible to negate all values given in the array to achieve the same behaviour.
    # (a Optional[Variant[Pattern[/^(?:!\s)?(?:INVALID|ESTABLISHED|NEW|RELATED|UNTRACKED|SNAT|DNAT)$/], Array[Pattern[/^(?:!\s)?(?:INVALID|ESTABLISHED|NEW|RELATED|UNTRACKED|SNAT|DNAT)$/]]]])
    Puppet::Resource::Param(Any, 'ctstate'),

    # The specific layer-4 protocol number to match for this rule using the
    #      conntrack module.
    # (a Optional[Variant[Pattern[/^(?:!\s)?\d+$/],Integer]])
    Puppet::Resource::Param(Any, 'ctproto'),

    # The original source address using the conntrack module. For example:
    # 
    #          ctorigsrc => '192.168.2.0/24'
    # 
    #      You can also negate a mask by putting ! in front. For example:
    # 
    #          ctorigsrc => '! 192.168.2.0/24'
    # 
    #      The ctorigsrc can also be an IPv6 address if your provider supports it.
    # (a Optional[String[1]])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'ctorigsrc'),

    # The original destination address using the conntrack module. For example:
    # 
    #          ctorigdst => '192.168.2.0/24'
    # 
    #      You can also negate a mask by putting ! in front. For example:
    # 
    #          ctorigdst => '! 192.168.2.0/24'
    # 
    #      The ctorigdst can also be an IPv6 address if your provider supports it.
    # (a Optional[String[1]])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'ctorigdst'),

    # The reply source address using the conntrack module. For example:
    # 
    #          ctreplsrc => '192.168.2.0/24'
    # 
    #      You can also negate a mask by putting ! in front. For example:
    # 
    #          ctreplsrc => '! 192.168.2.0/24'
    # 
    #      The ctreplsrc can also be an IPv6 address if your provider supports it.
    # (a Optional[String[1]])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'ctreplsrc'),

    # The reply destination address using the conntrack module. For example:
    # 
    #          ctrepldst => '192.168.2.0/24'
    # 
    #      You can also negate a mask by putting ! in front. For example:
    # 
    #          ctrepldst => '! 192.168.2.0/24'
    # 
    #      The ctrepldst can also be an IPv6 address if your provider supports it.
    # (a Optional[String[1]])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'ctrepldst'),

    # The original source port to match for this filter using the conntrack module.
    #      For example:
    # 
    #          ctorigsrcport => '80'
    # 
    #      You can also specify a port range: For example:
    # 
    #          ctorigsrcport => '80:81'
    # 
    #      You can also negate a port by putting ! in front. For example:
    # 
    #          ctorigsrcport => '! 80'
    # (a Optional[Pattern[/^(?:!\s)?\d+(?:\:\d+)?$/]])
    Puppet::Resource::Param(Any, 'ctorigsrcport'),

    # The original destination port to match for this filter using the conntrack module.
    #      For example:
    # 
    #          ctorigdstport => '80'
    # 
    #      You can also specify a port range: For example:
    # 
    #          ctorigdstport => '80:81'
    # 
    #      You can also negate a port by putting ! in front. For example:
    # 
    #          ctorigdstport => '! 80'
    # (a Optional[Pattern[/^(?:!\s)?\d+(?:\:\d+)?$/]])
    Puppet::Resource::Param(Any, 'ctorigdstport'),

    # The reply source port to match for this filter using the conntrack module.
    #      For example:
    # 
    #          ctreplsrcport => '80'
    # 
    #      You can also specify a port range: For example:
    # 
    #          ctreplsrcport => '80:81'
    # 
    #      You can also negate a port by putting ! in front. For example:
    # 
    #          ctreplsrcport => '! 80'
    # (a Optional[Pattern[/^(?:!\s)?\d+(?:\:\d+)?$/]])
    Puppet::Resource::Param(Any, 'ctreplsrcport'),

    # The reply destination port to match for this filter using the conntrack module.
    #      For example:
    # 
    #          ctrepldstport => '80'
    # 
    #      You can also specify a port range: For example:
    # 
    #          ctrepldstport => '80:81'
    # 
    #      You can also negate a port by putting ! in front. For example:
    # 
    #          ctrepldstport => '! 80'
    # (a Optional[Pattern[/^(?:!\s)?\d+(?:\:\d+)?$/]])
    Puppet::Resource::Param(Any, 'ctrepldstport'),

    # Matches a packet based on its status using the conntrack module. Values can be:
    # 
    #      * EXPECTED
    #      * SEEN_REPLY
    #      * ASSURED
    #      * CONFIRMED
    #      * NONE
    # 
    #      Can be passed either as a single String or as an Array:
    # 
    #        ctstatus => 'EXPECTED'
    #        ctstatus => ['EXPECTED', 'CONFIRMED']
    # 
    #      Values can be negated by adding a '!'.
    #      If you wish to negate multiple states at once, then place a ! at the start of the first array
    #      variable. For example:
    # 
    #        ctstatus => ['! EXPECTED', 'CONFIRMED']
    # 
    #      Note:
    #        This will negate all passed states, it is not possible to negate a single one of the array.
    #        In order to maintain compatibility it is also possible to negate all values given in the array to achieve the same behaviour.
    # (a Optional[Variant[Pattern[/^(?:!\s)?(?:EXPECTED|SEEN_REPLY|ASSURED|CONFIRMED|NONE)$/], Array[Pattern[/^(?:!\s)?(?:EXPECTED|SEEN_REPLY|ASSURED|CONFIRMED|NONE)$/]]]])
    Puppet::Resource::Param(Any, 'ctstatus'),

    # Matches a packet based on lifetime remaining in seconds or range of seconds
    #      using the conntrack module. For example:
    # 
    #        ctexpire => '100'
    #        ctexpire => '100:150'
    # (a Optional[Pattern[/^(?:!\s)?\d+(?:\:\d+)?$/]])
    Puppet::Resource::Param(Any, 'ctexpire'),

    # Matches a packet that is flowing in the specified direction using the
    #      conntrack module. If this flag is not specified at all, matches packets
    #      in both directions. Values can be:
    # 
    #      * REPLY
    #      * ORIGINAL
    # (a Optional[Enum['REPLY', 'ORIGINAL']])
    Puppet::Resource::Param(Any, 'ctdir'),

    # Hop limiting value for matched packets.
    #      To negate add a space seperated `!` the the beginning of the value
    #      This is IPv6 specific.
    # (a Optional[Variant[Pattern[/^(?:!\s)?\d+$/],Integer]])
    Puppet::Resource::Param(Any, 'hop_limit'),

    # When matching ICMP packets, this is the type of ICMP packet to match.
    # 
    #      A value of "any" is not supported. To achieve this behaviour the
    #      parameter should simply be omitted or undefined.
    #      An array of values is also not supported. To match against multiple ICMP
    #      types, please use separate rules for each ICMP type.
    # (a Optional[Variant[String[1],Integer]])
    Puppet::Resource::Param(Any, 'icmp'),

    # Rate limiting value for matched packets. The format is:
    #      rate/[/second/|/minute|/hour|/day]
    # 
    #      Example values are: '50/sec', '40/min', '30/hour', '10/day'."
    # (a Optional[Pattern[/^\d+\/(?:sec(?:ond)?|min(?:ute)?|hour|day)$/]])
    Puppet::Resource::Param(Any, 'limit'),

    # Rate limiting burst value (per second) before limit checks apply.
    # (a Optional[Integer[1]])
    # 
    # Values can match `/^-?\d+$/`.
    Puppet::Resource::Param(Pattern[/^-?\d+$/], 'burst'),

    # Sets the length of layer-3 payload to match.
    # 
    #      Example values are: '500', '5:400'
    # (a Optional[Pattern[/^([0-9]+)(:)?([0-9]+)?$/]])
    Puppet::Resource::Param(Any, 'length'),

    # Enable the recent module. Takes as an argument one of set, update,
    #      rcheck or remove. For example:
    # 
    #        ```
    #        # If anyone's appeared on the 'badguy' blacklist within
    #        #  the last 60 seconds, drop their traffic, and update the timestamp.
    #        firewall { '100 Drop badguy traffic':
    #          recent   => 'update',
    #          rseconds => 60,
    #          rsource  => true,
    #          rname    => 'badguy',
    #          jump     => 'DROP',
    #          chain    => 'FORWARD',
    #        }
    #        ```
    # 
    # 
    #        ```
    #        # No-one should be sending us traffic on eth0 from the
    #        #  localhost, Blacklist them
    #        firewall { '101 blacklist strange traffic':
    #          recent      => 'set',
    #          rsource     => true,
    #          rname       => 'badguy',
    #          destination => '127.0.0.0/8',
    #          iniface     => 'eth0',
    #          jump        => 'DROP',
    #          chain       => 'FORWARD',
    #        }
    #        ```
    # (a Optional[Enum['set', 'update', 'rcheck', 'remove', '! set', '! update', '! rcheck', '! remove']])
    Puppet::Resource::Param(Any, 'recent'),

    # Recent module; used in conjunction with one of `recent => 'rcheck'` or
    #      `recent => 'update'`. When used, this will narrow the match to only
    #      happen when the address is in the list and was seen within the last given
    #      number of seconds.
    # (a Optional[Integer[1]])
    # 
    # Values can match `/^-?\d+$/`.
    Puppet::Resource::Param(Pattern[/^-?\d+$/], 'rseconds'),

    # Recent module; can only be used in conjunction with the `rseconds`
    #      attribute. When used, this will cause entries older than 'seconds' to be
    #      purged.  Must be boolean true.
    # (a Optional[Boolean])
    # 
    # Valid values are `true` (also called `true, true`), `false` (also called `false, false`).
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'true', 'true', 'false', 'false', 'false']], 'reap'),

    # Recent module; used in conjunction with `recent => 'update'` or `recent
    #      => 'rcheck'. When used, this will narrow the match to only happen when
    #      the address is in the list and packets had been received greater than or
    #      equal to the given value.
    # (a Optional[Integer[1]])
    # 
    # Values can match `/^-?\d+$/`.
    Puppet::Resource::Param(Pattern[/^-?\d+$/], 'rhitcount'),

    # Recent module; may only be used in conjunction with one of `recent =>
    #      'rcheck'` or `recent => 'update'`. When used, this will narrow the match
    #      to only happen when the address is in the list and the TTL of the current
    #      packet matches that of the packet which hit the `recent => 'set'` rule.
    #      This may be useful if you have problems with people faking their source
    #      address in order to DoS you via this module by disallowing others access
    #      to your site by sending bogus packets to you.  Must be boolean true.
    # (a Optional[Boolean])
    # 
    # Valid values are `true` (also called `true, true`), `false` (also called `false, false`).
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'true', 'true', 'false', 'false', 'false']], 'rttl'),

    # Recent module; The name of the list.
    #      The recent module defaults this to `DEFAULT` when recent is set
    # (a Optional[String[1]])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'rname'),

    # Recent module; sets the mask to use when `recent` is enabled.
    #      The recent module defaults this to `255.255.255.255` when recent is set
    # (a Optional[Pattern[/^\d+\.\d+\.\d+\.\d+$/]])
    Puppet::Resource::Param(Any, 'mask'),

    # Recent module; add the source IP address to the list.
    #      Mutually exclusive with `rdest`
    #      The recent module defaults this behaviour to true when recent is set.
    # (a Optional[Boolean])
    # 
    # Valid values are `true` (also called `true, true`), `false` (also called `false, false`).
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'true', 'true', 'false', 'false', 'false']], 'rsource'),

    # Recent module; add the destination IP address to the list.
    #      Mutually exclusive with `rsource`
    #      Must be boolean true.
    # (a Optional[Boolean])
    # 
    # Valid values are `true` (also called `true, true`), `false` (also called `false, false`).
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'true', 'true', 'false', 'false', 'false']], 'rdest'),

    # Matches against the specified ipset list.
    #      Requires ipset kernel module. Will accept a single element or an array.
    #      The value is the name of the denylist, followed by a space, and then
    #      'src' and/or 'dst' separated by a comma.
    #      For example: 'denylist src,dst'
    #      To negate simply place a space seperated `!` at the beginning of a value.
    #      Values can de negated independently.
    # (a Optional[Variant[Pattern[/^(?:!\s)?\w+\s(?:src|dst)(?:,src|,dst)?$/], Array[Pattern[/^(?:!\s)?\w+\s(?:src|dst)(?:,src|,dst)?$/]]]])
    Puppet::Resource::Param(Any, 'ipset'),

    # String matching feature. Matches the packet against the pattern
    #      given as an argument.
    #      To negate, add a space seperated `!` to the beginning of the string.
    # (a Optional[String[1]])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'string'),

    # String matching feature. Matches the packet against the pattern
    #      given as an argument.
    #      To negate, add a space seperated `!` to the beginning of the string.
    # (a Optional[Pattern[/^(?:!\s)?\|[a-zA-Z0-9\s]+\|$/]])
    Puppet::Resource::Param(Any, 'string_hex'),

    # String matching feature, pattern matching strategy.
    # (a Optional[Enum['bm', 'kmp']])
    Puppet::Resource::Param(Any, 'string_algo'),

    # String matching feature, offset from which we start looking for any matching.
    # (a Optional[Integer[1]])
    # 
    # Values can match `/^-?\d+$/`.
    Puppet::Resource::Param(Pattern[/^-?\d+$/], 'string_from'),

    # String matching feature, offset up to which we should scan.
    # (a Optional[Integer[1]])
    # 
    # Values can match `/^-?\d+$/`.
    Puppet::Resource::Param(Pattern[/^-?\d+$/], 'string_to'),

    # This value for the iptables --jump parameter and the action to perform on a match. Common values are:
    # 
    #      * ACCEPT - the packet is accepted
    #      * REJECT - the packet is rejected with a suitable ICMP response
    #      * DROP - the packet is dropped
    # 
    #      But can also be one of the following:
    # 
    #      * QUEUE
    #      * RETURN
    #      * DNAT
    #      * SNAT
    #      * LOG
    #      * NFLOG
    #      * NETMAP
    #      * MASQUERADE
    #      * REDIRECT
    #      * MARK
    #      * CT
    # 
    #      And any valid chain name is also allowed.
    # 
    #      If you specify no value it will simply match the rule but perform no action.
    # (a Optional[String[1]])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'jump'),

    # The value for the iptables --goto parameter. Normal values are:
    # 
    #      * QUEUE
    #      * RETURN
    #      * DNAT
    #      * SNAT
    #      * LOG
    #      * MASQUERADE
    #      * REDIRECT
    #      * MARK
    # 
    #      But any valid chain name is allowed.
    # (a Optional[String[1]])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'goto'),

    # Used with the CLUSTERIP jump target.
    #      Create a new ClusterIP. You always have to set this on the first rule for a given ClusterIP.
    #      This is IPv4 specific.
    # (a Optional[Boolean])
    # 
    # Valid values are `true` (also called `true, true`), `false` (also called `false, false`).
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'true', 'true', 'false', 'false', 'false']], 'clusterip_new'),

    # Used with the CLUSTERIP jump target.
    #      Specify the hashing mode.
    #      This is IPv4 specific.
    # (a Optional[Enum['sourceip', 'sourceip-sourceport', 'sourceip-sourceport-destport']])
    Puppet::Resource::Param(Any, 'clusterip_hashmode'),

    # Used with the CLUSTERIP jump target.
    #      Specify the ClusterIP MAC address. Has to be a link-layer multicast address.
    #      This is IPv4 specific.
    # (a Optional[Pattern[/^([0-9a-fA-F]{2}[:]){5}([0-9a-fA-F]{2})$/]])
    Puppet::Resource::Param(Any, 'clusterip_clustermac'),

    # Used with the CLUSTERIP jump target.
    #      Number of total nodes within this cluster.
    #      This is IPv4 specific.
    # (a Optional[Integer[1]])
    # 
    # Values can match `/^-?\d+$/`.
    Puppet::Resource::Param(Pattern[/^-?\d+$/], 'clusterip_total_nodes'),

    # Used with the CLUSTERIP jump target.
    #      Specify the random seed used for hash initialization.
    #      This is IPv4 specific.
    # (a Optional[Integer[1]])
    # 
    # Values can match `/^-?\d+$/`.
    Puppet::Resource::Param(Pattern[/^-?\d+$/], 'clusterip_local_node'),

    # Used with the CLUSTERIP jump target.
    #      Specify the random seed used for hash initialization.
    #      This is IPv4 specific.
    # (a Optional[String[1]])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'clusterip_hash_init'),

    # Used with NFQUEUE jump target.
    #      What queue number to send packets to
    # (a Optional[Integer[1]])
    # 
    # Values can match `/^-?\d+$/`.
    Puppet::Resource::Param(Pattern[/^-?\d+$/], 'queue_num'),

    # Allow packets to bypass :queue_num if userspace process is not listening
    # (a Optional[Boolean])
    # 
    # Valid values are `true` (also called `true, true`), `false` (also called `false, false`).
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'true', 'true', 'false', 'false', 'false']], 'queue_bypass'),

    # Used with the jump target NFLOG.
    #      The netlink group (0 - 2^16-1) to which packets are (only applicable
    #      for nfnetlink_log). Defaults to 0.
    # (a Optional[Integer[1, 65535]])
    # 
    # Values can match `/^-?\d+$/`.
    Puppet::Resource::Param(Pattern[/^-?\d+$/], 'nflog_group'),

    # Used with the jump target NFLOG.
    #      A prefix string to include in the log message, up to 64 characters long,
    #      useful for distinguishing messages in the logs.
    # (a Optional[String])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'nflog_prefix'),

    # Used with the jump target NFLOG.
    #      This has never worked, use nflog_size instead.
    # (a Optional[Integer[1]])
    # 
    # Values can match `/^-?\d+$/`.
    Puppet::Resource::Param(Pattern[/^-?\d+$/], 'nflog_range'),

    # Used with the jump target NFLOG.
    #      The number of bytes to be copied to userspace (only applicable for nfnetlink_log).
    #      nfnetlink_log instances may specify their own size, this option overrides it.
    # (a Optional[Integer[1]])
    # 
    # Values can match `/^-?\d+$/`.
    Puppet::Resource::Param(Pattern[/^-?\d+$/], 'nflog_size'),

    # Used with the jump target NFLOG.
    #      Number of packets to queue inside the kernel before sending them to userspace
    #      (only applicable for nfnetlink_log). Higher values result in less overhead
    #      per packet, but increase delay until the packets reach userspace. Defaults to 1.
    # (a Optional[Integer[1]])
    # 
    # Values can match `/^-?\d+$/`.
    Puppet::Resource::Param(Pattern[/^-?\d+$/], 'nflog_threshold'),

    # The TEE target will clone a packet and redirect this clone to another
    #      machine on the local network segment.
    #      Gateway is the target host's IP.
    # (a Optional[Pattern[/^(\d+.\d+.\d+.\d+|\w+:\w+::\w+)$/]])
    Puppet::Resource::Param(Any, 'gateway'),

    # Sets the clamp mss to pmtu flag.
    # (a Optional[Boolean])
    # 
    # Valid values are `true` (also called `true, true`), `false` (also called `false, false`).
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'true', 'true', 'false', 'false', 'false']], 'clamp_mss_to_pmtu'),

    # Sets the TCP MSS value for packets.
    # (a Optional[Integer[1]])
    # 
    # Values can match `/^-?\d+$/`.
    Puppet::Resource::Param(Pattern[/^-?\d+$/], 'set_mss'),

    # Set DSCP Markings.
    # (a Optional[String[1]])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'set_dscp'),

    # This sets the DSCP field according to a predefined DiffServ class.
    # (a Optional[Enum['af11', 'af12', 'af13', 'af21', 'af22', 'af23', 'af31', 'af32', 'af33', 'af41', 'af42', 'af43', 'cs1', 'cs2', 'cs3', 'cs4', 'cs5', 'cs6', 'cs7', 'ef']])
    Puppet::Resource::Param(Any, 'set_dscp_class'),

    # When using jump => "DNAT" you can specify the new destination address using this paramter.
    #      Can specify a single new destination IP address or an inclusive range of IP addresses.
    #      Optionally a port or a port range with a possible follow up baseport can be provided.
    #      Input structure: [ipaddr[-ipaddr]][:port[-port[/baseport]]]
    # (a Optional[String[1]])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'todest'),

    # When using jump => "SNAT" you can specify the new source address using this paramter.
    #      Can specify a single new destination IP address or an inclusive range of IP addresses.
    #      Input structure: [ipaddr[-ipaddr]][:port[-port]]
    # (a Optional[String[1]])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'tosource'),

    # For REDIRECT/MASQUERADE this is the port that will replace the destination/source port.
    #      Can specify a single new port or an inclusive range of ports.
    # (a Optional[Pattern[/^\d+(?:-\d+)?$/]])
    Puppet::Resource::Param(Any, 'toports'),

    # For NETMAP this will replace the destination IP
    # (a Optional[String[1]])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'to'),

    # Compute and fill missing packet checksums.
    # (a Optional[Boolean])
    # 
    # Valid values are `true` (also called `true, true`), `false` (also called `false, false`).
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'true', 'true', 'false', 'false', 'false']], 'checksum_fill'),

    # When using a jump value of "MASQUERADE", "DNAT", "REDIRECT", or "SNAT" this boolean will enable fully randomized port mapping.
    # (a Optional[Boolean])
    # 
    # Valid values are `true` (also called `true, true`), `false` (also called `false, false`).
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'true', 'true', 'false', 'false', 'false']], 'random_fully'),

    # When using a jump value of "MASQUERADE", "DNAT", "REDIRECT", or "SNAT" this boolean will enable randomized port mapping.
    # (a Optional[Boolean])
    # 
    # Valid values are `true` (also called `true, true`), `false` (also called `false, false`).
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'true', 'true', 'false', 'false', 'false']], 'random'),

    # When combined with jump => "LOG" specifies the log prefix to use when logging.
    # (a Optional[String[1]])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'log_prefix'),

    # When combined with jump => "LOG" specifies the system log level to log to.
    # 
    #      Note: log level 4/warn is the default setting and as such it is not returned by iptables-save.
    #      As a result, explicitly setting `log_level` to this can result in idempotency errors.
    # (a Optional[Variant[Integer[0,7],String[1]]])
    Puppet::Resource::Param(Any, 'log_level'),

    # When combined with jump => "LOG" specifies the uid of the process making the connection.
    # (a Optional[Boolean])
    # 
    # Valid values are `true` (also called `true, true`), `false` (also called `false, false`).
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'true', 'true', 'false', 'false', 'false']], 'log_uid'),

    # When combined with jump => "LOG" enables logging of the TCP sequence numbers.
    # (a Optional[Boolean])
    # 
    # Valid values are `true` (also called `true, true`), `false` (also called `false, false`).
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'true', 'true', 'false', 'false', 'false']], 'log_tcp_sequence'),

    # When combined with jump => "LOG" logging of the TCP packet header.
    # (a Optional[Boolean])
    # 
    # Valid values are `true` (also called `true, true`), `false` (also called `false, false`).
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'true', 'true', 'false', 'false', 'false']], 'log_tcp_options'),

    # When combined with jump => "LOG" logging of the TCP IP/IPv6 packet header.
    # (a Optional[Boolean])
    # 
    # Valid values are `true` (also called `true, true`), `false` (also called `false, false`).
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'true', 'true', 'false', 'false', 'false']], 'log_ip_options'),

    # When combined with jump => "REJECT" you can specify a different icmp response to be sent back to the packet sender.
    #      Valid values differ depending on if the protocol is `IPv4` or `IPv6`.
    #      IPv4 allows: icmp-net-unreachable, icmp-host-unreachable, icmp-port-unreachable, icmp-proto-unreachable, icmp-net-prohibited,
    #      icmp-host-prohibited, or icmp-admin-prohibited.
    #      IPv6 allows: icmp6-no-route, no-route, icmp6-adm-prohibited, adm-prohibited, icmp6-addr-unreachable, addr-unreach, or icmp6-port-unreachable.
    # (a Optional[Enum['icmp-net-unreachable', 'icmp-host-unreachable', 'icmp-port-unreachable', 'icmp-proto-unreachable',
    #                              'icmp-net-prohibited', 'icmp-host-prohibited', 'icmp-admin-prohibited', 'icmp6-no-route', 'no-route',
    #                              'icmp6-adm-prohibited', 'adm-prohibited', 'icmp6-addr-unreachable', 'addr-unreach', 'icmp6-port-unreachable']])
    Puppet::Resource::Param(Any, 'reject'),

    # Set the Netfilter mark value associated with the packet.  Accepts either of mark/mask or mark.
    #      These will be converted to hex if they are not already.
    # (a Optional[Pattern[/^[a-fA-F0-9x]+(?:\/[a-fA-F0-9x]+)?$/]])
    Puppet::Resource::Param(Any, 'set_mark'),

    # Match the Netfilter mark value associated with the packet, accepts a mark.
    #      This value will be converted to hex if it is not already.
    #      This value can be negated by adding a space seperated `!` to the beginning.
    # (a Optional[Pattern[/^(?:!\s)?[a-fA-F0-9x]+$/]])
    Puppet::Resource::Param(Any, 'match_mark'),

    # Match a given TCP MSS value or range.
    #      This value can be negated by adding a space seperated `!` to the beginning.
    # (a Optional[Pattern[/^(?:!\s)?\d+(?:\:\d+)?$/]])
    Puppet::Resource::Param(Any, 'mss'),

    # Connection limiting value for matched connections below or equal to n.
    # (a Optional[Integer])
    # 
    # Values can match `/^-?\d+$/`.
    Puppet::Resource::Param(Pattern[/^-?\d+$/], 'connlimit_upto'),

    # Connection limiting value for matched connections above n.
    # (a Optional[Integer])
    # 
    # Values can match `/^-?\d+$/`.
    Puppet::Resource::Param(Pattern[/^-?\d+$/], 'connlimit_above'),

    # Connection limiting by subnet mask for matched connections.
    #      IPv4: 0-32
    #      IPv6: 0-128
    # (a Optional[Integer[0,128]])
    # 
    # Values can match `/^-?\d+$/`.
    Puppet::Resource::Param(Pattern[/^-?\d+$/], 'connlimit_mask'),

    # Match the Netfilter mark value associated with the packet, accepts a mark.
    #      This value will be converted to hex if it is not already.
    #      This value can be negated by adding a space seperated `!` to the beginning.
    # (a Optional[Pattern[/^(?:!\s)?[a-fA-F0-9x]+$/]])
    Puppet::Resource::Param(Any, 'connmark'),

    # Only match during the given daytime. The possible time range is 00:00:00 to 23:59:59.
    #      Leading zeroes are allowed (e.g. "06:03") and correctly interpreted as base-10.
    # (a Optional[Pattern[/^([0-9]|[0-1][0-9]|2[0-3])\:[0-5][0-9](?:\:[0-5][0-9])?/]])
    Puppet::Resource::Param(Any, 'time_start'),

    # Only match during the given daytime. The possible time range is 00:00:00 to 23:59:59.
    #      Leading zeroes are allowed (e.g. "06:03") and correctly interpreted as base-10.
    # (a Optional[Pattern[/^([0-9]|[0-1][0-9]|2[0-3])\:[0-5][0-9](?:\:[0-5][0-9])?/]])
    Puppet::Resource::Param(Any, 'time_stop'),

    # Only match on the given days of the month. Possible values are 1 to 31.
    #      Note that specifying 31 will of course not match on months which do not have a 31st day;
    #      the same goes for 28-day or 29-day February.
    # 
    #      Can be passed either as a single value or an array of values:
    #        month_days => 5,
    #        month_days => [5, 9, 23],
    # (a Optional[Variant[Integer[0,31], Array[Integer[0,31]]]])
    Puppet::Resource::Param(Any, 'month_days'),

    # Only match on the given weekdays.
    # 
    #      Can be passed either as a single value or an array of values:
    #        week_days => 'Mon',
    #        week_days => ['Mon', 'Tue', 'Wed'],
    # (a Optional[Variant[Enum['Mon','Tue','Wed','Thu','Fri','Sat','Sun'], Array[Enum['Mon','Tue','Wed','Thu','Fri','Sat','Sun']]]])
    Puppet::Resource::Param(Any, 'week_days'),

    # Only match during the given time, which must be in ISO 8601 "T" notation.
    #      The possible time range is 1970-01-01T00:00:00 to 2038-01-19T04:17:07
    # (a Optional[Pattern[/^[0-9]{4}\-(?:0[0-9]|1[0-2])\-(?:[0-2][0-9]|3[0-1])T(?:[0-1][0-9]|2[0-3])\:[0-5][0-9]\:[0-5][0-9]$/]])
    Puppet::Resource::Param(Any, 'date_start'),

    # Only match during the given time, which must be in ISO 8601 "T" notation.
    #      The possible time range is 1970-01-01T00:00:00 to 2038-01-19T04:17:07
    # (a Optional[Pattern[/^[0-9]{4}\-(?:0[0-9]|1[0-2])\-(?:[0-2][0-9]|3[0-1])T(?:[0-1][0-9]|2[0-3])\:[0-5][0-9]\:[0-5][0-9]$/]])
    Puppet::Resource::Param(Any, 'date_stop'),

    # When time_stop is smaller than time_start value, match this as a single time period instead distinct intervals.
    # (a Optional[Boolean])
    # 
    # Valid values are `true` (also called `true, true`), `false` (also called `false, false`).
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'true', 'true', 'false', 'false', 'false']], 'time_contiguous'),

    # Use the kernel timezone instead of UTC to determine whether a packet meets the time regulations.
    # (a Optional[Boolean])
    # 
    # Valid values are `true` (also called `true, true`), `false` (also called `false, false`).
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'true', 'true', 'false', 'false', 'false']], 'kernel_timezone'),

    # Enable the u32 module. Takes as an argument one of set, update,
    #      rcheck or remove. For example:
    #        firewall { '032 u32 test':
    #          ensure   => present,
    #          table    => 'mangle',
    #          chain    => 'PREROUTING',
    #          u32      => '0x4&0x1fff=0x0&&0x0&0xf000000=0x5000000',
    #          jump     => 'DROP',
    #        }
    # (a Optional[Pattern[/^0x[0-9a-fA-F]+&0x[0-9a-fA-F]+=0x[0-9a-fA-F]+(?::0x[0-9a-fA-F]+)?(?:&&0x[0-9a-fA-F]+&0x[0-9a-fA-F]+=0x[0-9a-fA-F]+(?::0x[0-9a-fA-F]+)?)*$/]])
    Puppet::Resource::Param(Any, 'u32'),

    # src attribute for the module geoip
    # (a Optional[Pattern[/^[A-Z]{2}(,[A-Z]{2})*$/]])
    Puppet::Resource::Param(Any, 'src_cc'),

    # dst attribute for the module geoip
    # (a Optional[Pattern[/^[A-Z]{2}(,[A-Z]{2})*$/]])
    Puppet::Resource::Param(Any, 'dst_cc'),

    # Match if the rate is below or equal to amount/quantum. It is specified either as a number, with an optional time quantum suffix (the default is 3/hour), or as amountb/second (number of bytes per second).
    #      This parameter or `hashlimit_above` and `hashlimit_name` are required when setting any other hashlimit values.
    #      Allowed forms are '40','40/sec','40/min','40/hour','40/day'.
    # (a Optional[Pattern[/^\d+(?:\/(?:sec|min|hour|day))?$/]])
    Puppet::Resource::Param(Any, 'hashlimit_upto'),

    # Match if the rate is above amount/quantum.
    #      This parameter or `hashlimit_upto` and `hashlimit_name` are required when setting any other hashlimit values.
    #      Allowed forms are '40','40/sec','40/min','40/hour','40/day'.
    # (a Optional[Pattern[/^\d+(?:\/(?:sec|min|hour|day))?$/]])
    Puppet::Resource::Param(Any, 'hashlimit_above'),

    # The name for the /proc/net/ipt_hashlimit/foo entry.
    #      This parameter and either `hashlimit_upto` or `hashlimit_above` are required when setting any other hashlimit values.
    # (a Optional[String[1]])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'hashlimit_name'),

    # Maximum initial number of packets to match: this number gets recharged by one every time the limit specified above is not reached, up to this number; the default is 5.
    #      When byte-based rate matching is requested, this option specifies the amount of bytes that can exceed the given rate.
    #      This option should be used with caution -- if the entry expires, the burst value is reset too.
    # (a Optional[Integer[1]])
    # 
    # Values can match `/^-?\d+$/`.
    Puppet::Resource::Param(Pattern[/^-?\d+$/], 'hashlimit_burst'),

    # A comma-separated list of objects to take into consideration.
    #      If no --hashlimit-mode option is given, hashlimit acts like limit, but at the expensive of doing the hash housekeeping.
    #      Allowed values are: srcip, srcport, dstip, dstport
    # (a Optional[Pattern[/^(?:srcip|srcport|dstip|dstport)(?:\,(?:srcip|srcport|dstip|dstport))*$/]])
    Puppet::Resource::Param(Any, 'hashlimit_mode'),

    # When --hashlimit-mode srcip is used, all source addresses encountered will be grouped according to the given prefix length
    #      and the so-created subnet will be subject to hashlimit.
    #      Prefix must be between (inclusive) 0 and 32.
    #      Note that --hashlimit-srcmask 0 is basically doing the same thing as not specifying srcip for --hashlimit-mode, but is technically more expensive.
    # (a Optional[Integer[0,32]])
    # 
    # Values can match `/^-?\d+$/`.
    Puppet::Resource::Param(Pattern[/^-?\d+$/], 'hashlimit_srcmask'),

    # When --hashlimit-mode srcip is used, all destination addresses encountered will be grouped according to the given prefix length
    #      and the so-created subnet will be subject to hashlimit.
    #      Prefix must be between (inclusive) 0 and 32.
    #      Note that --hashlimit-dstmask 0 is basically doing the same thing as not specifying srcip for --hashlimit-mode, but is technically more expensive.
    # (a Optional[Integer[0,32]])
    # 
    # Values can match `/^-?\d+$/`.
    Puppet::Resource::Param(Pattern[/^-?\d+$/], 'hashlimit_dstmask'),

    # The number of buckets of the hash table
    # (a Optional[Integer])
    # 
    # Values can match `/^-?\d+$/`.
    Puppet::Resource::Param(Pattern[/^-?\d+$/], 'hashlimit_htable_size'),

    # Maximum entries in the hash.
    # (a Optional[Integer])
    # 
    # Values can match `/^-?\d+$/`.
    Puppet::Resource::Param(Pattern[/^-?\d+$/], 'hashlimit_htable_max'),

    # After how many milliseconds do hash entries expire.
    # (a Optional[Integer])
    # 
    # Values can match `/^-?\d+$/`.
    Puppet::Resource::Param(Pattern[/^-?\d+$/], 'hashlimit_htable_expire'),

    # How many milliseconds between garbage collection intervals.
    # (a Optional[Integer])
    # 
    # Values can match `/^-?\d+$/`.
    Puppet::Resource::Param(Pattern[/^-?\d+$/], 'hashlimit_htable_gcinterval'),

    # Match using Linux Socket Filter. Expects a BPF program in decimal format.
    #      This is the format generated by the nfbpf_compile utility.
    # (a Optional[String[1]])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'bytecode'),

    # Match using Linux Socket Filter. Expects a BPF program in decimal format.
    #      This is the format generated by the nfbpf_compile utility.
    # (a Optional[Boolean])
    # 
    # Valid values are `true` (also called `true, true`), `false` (also called `false, false`).
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'true', 'true', 'false', 'false', 'false']], 'ipvs'),

    # Assign this packet to zone id and only have lookups done in that zone.
    # (a Optional[Integer])
    # 
    # Values can match `/^-?\d+$/`.
    Puppet::Resource::Param(Pattern[/^-?\d+$/], 'zone'),

    # Invoke the nf_conntrack_xxx helper module for this packet.
    # (a Optional[String[1]])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'helper'),

    # Matches against the net_cls cgroup ID of the packet.
    # 
    #      To negate add a space seperate `!` to the beginning of the string
    # (a Optional[String[1]])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'cgroup'),

    # Enable the rpfilter module.
    # (a Optional[Variant[Enum['loose', 'validmark', 'accept-local', 'invert'], Array[Enum['loose', 'validmark', 'accept-local', 'invert']]]])
    Puppet::Resource::Param(Any, 'rpfilter'),

    # Match on boolean value (0/1) stored in /proc/net/nf_condition/name.
    # (a Optional[String[1]])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'condition'),

    # Invoke the disable connection tracking for this packet.
    #      This parameter can be used with iptables version >= 1.8.3
    # (a Optional[Boolean])
    # 
    # Valid values are `true` (also called `true, true`), `false` (also called `false, false`).
    Puppet::Resource::Param(Variant[Boolean, Enum['true', 'true', 'true', 'false', 'false', 'false']], 'notrack')
  ],
  [
    # The canonical name of the rule. This name is also used for ordering
    #      so make sure you prefix the rule with a number:
    # 
    #          000 this runs first
    #          999 this runs last
    # 
    #      Depending on the provider, the name of the rule can be stored using
    #      the comment feature of the underlying firewall subsystem.
    # (a Pattern[/(^\d+(?:[ \t-]\S+)+$)/])
    Puppet::Resource::Param(Any, 'name', true),

    # A read only attribute containing the full rule, used when deleting and when applying firewallchain purge attributes.
    # (a Optional[String[1]])
    # 
    # Values can match `//`.
    Puppet::Resource::Param(Pattern[//], 'line')
  ],
  {
    /(?m-ix:(.*))/ => ['name']
  },
  true,
  false)
