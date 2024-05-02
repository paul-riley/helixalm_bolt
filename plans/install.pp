#
plan helixalm::install (
  TargetSpec $targets,
) {
  # Require the apply_prep to use the apply block
  apply_prep($targets)

  # This collects facts on targets and updates the inventory
  run_plan('facts', 'targets' => $targets)

  #Shortcut if nothing is there.
  if targets.empty { return ResultSet.new([]) }

  # Puppet apply
  $apply_result = apply($targets){
    package { lookup('required_packages'): 
      ensure => installed,
    }
    package { lookup('webserver_type'):
      ensure => installed,
    }

    if $facts['os']['family'] == 'RedHat' {
      require selinux
      require firewalld

      service { lookup('webserver_type'):
        ensure    => running,
      }
    }

    if $facts['os']['name'] == 'Ubuntu' {
      require firewall

      exec { 'apache_mod':
        command => ['/usr/sbin/a2enmod', 'cgi'],
        require => [Package[lookup('required_packages')],Package[lookup('webserver_type')]],
      }

      file { lookup('webserver_config_file'):
        ensure  => file,
        content => file('helixalm/cgi.conf'),
      }
    }
  }

  # Handle errors from the apply block
  unless $apply_result.ok {
    out::message("The configuration application failed on #{$result.error_set.targets}")
  }
}
