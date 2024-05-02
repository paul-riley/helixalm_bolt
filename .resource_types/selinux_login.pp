# This file was automatically generated on 2024-05-02 14:20:29 -0600.
# Use the 'puppet generate types' command to regenerate this file.

# Manage SELinux login definitions. You should use selinux::login instead of this directly.
Puppet::Resource::ResourceType3.new(
  'selinux_login',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure'),

    # The name of the linux user or group to map.
    Puppet::Resource::Param(Any, 'selinux_login_name'),

    # The selinux user to map to.
    Puppet::Resource::Param(Any, 'selinux_user'),

    # Source of the login configuration - either policy or local
    # 
    # Valid values are `policy`, `local`.
    Puppet::Resource::Param(Enum['policy', 'local'], 'source')
  ],
  [
    # Should be of the form "linuxuser_selinuxuser" or the type may misbehave
    Puppet::Resource::Param(Any, 'title', true),

    # The specific backend to use for this `selinux_login`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # semanage
    # : Support managing SELinux login definitions via semanage
    # 
    #   * Required binaries: `/usr/local/bin/python`, `semanage`.
    #   * Default for `kernel` == `Linux`.
    Puppet::Resource::Param(Any, 'provider')
  ],
  {
    /(?m-ix:(.*))/ => ['title']
  },
  true,
  false)
