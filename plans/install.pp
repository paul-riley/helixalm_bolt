# @summary Installs the prerequisites for HelixALM
#
# @param targets The targets to install HelixALM.# 
# @example Using Plan
#   priley::install($targets)
plan helixalm::install (
  TargetSpec $targets,
) {
  # Require the apply_prep to use the apply block
  apply_prep($targets)

  # This collects facts on targets and updates the inventory
  run_plan('facts', 'targets' => $targets)

  #Shortcut if nothing is there.
  if targets.empty { return ResultSet.new([]) }

  #Puppet apply for targets. Sets up requirements, configures firewall and starts web server.
  $apply_result = apply($targets) {
    package { lookup('required_packages'):
      ensure => installed,
    }
    package { lookup('webserver_type'):
      ensure => installed,
    }

    if $facts['os']['family'] == 'RedHat' {
      require firewalld
      firewalld_port { lookup('firewall.firewalld_name'):
        ensure   => lookup('firewall.ensure'),
        zone     => lookup('firewall.zone'),
        port     => lookup('firewall.port'),
        protocol => lookup('firewall.protocol'),
      }

      class { 'selinux':
        mode    => lookup('selinux.mode'),
        require => [Package[lookup('required_packages')],Package[lookup('webserver_type')]],
        notify  => Service[lookup('webserver_type')],
      }
    }

    if $facts['os']['name'] == 'Ubuntu' {
      require firewall
      firewall { lookup('firewall.iptables_name'):
        proto => lookup('firewall.protocol'),
        dport => lookup('firewall.port'),
        jump  => lookup('firewall.jump'),
      }

      exec { 'apache_mod':
        command => ['/usr/sbin/a2enmod', 'cgi'],
        require => [Package[lookup('required_packages')],Package[lookup('webserver_type')]],
      }

      file { lookup('webserver_config_file'):
        ensure  => file,
        content => file('helixalm/cgi.conf'),
        notify  => Service[lookup('webserver_type')],
      }
    }
    service { lookup('webserver_type'):
      ensure  => running,
      require => [Package[lookup('required_packages')],Package[lookup('webserver_type')]],
    }
  }

  # Handle errors from the apply block
  unless $apply_result.ok {
    out::message("The configuration application failed on #{${result.error_set.targets}")
  }
}
