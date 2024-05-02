#
plan helixalm::install (
  TargetSpec $targets,
) {
  # Require the apply_prep to use the apply block
  apply_prep($targets)

  # This collects facts on targets and updates the inventory
  run_plan('facts', 'targets' => $targets)

  $ubuntu_targets = get_targets($targets).filter |$n| { $n.facts['os']['name'] == 'Ubuntu' }
  $el_targets = get_targets($targets).filter |$n| { $n.facts['os']['family'] == 'RedHat' }
  $failed_targets = get_targets($targets).filter |$n| { $n.facts['os']['name'] != 'Ubuntu' } # Should return this list as unsupported OS

  if $ubuntu_targets and $el_targets {
    $valid_targets = $ubuntu_targets + $el_targets
  } elsif $el_targets {
    $valid_targets = $el_targets
  } elsif $ubuntu_targets {
    $valid_targets = $ubuntu_targets
  }

  #Shortcut if nothing is there.
  if $valid_targets.empty { return ResultSet.new([]) }

  # Puppet apply
  $apply_result = apply($valid_targets){
    package { lookup('required_packages'): 
      ensure => installed,
    }
    package { lookup('webserver_type'):
      ensure => installed,
    }

    if $el_targets {
      require selinux
      require firewalld

      service { lookup('webserver_type'):
        ensure    => running,
      }
    }

    if $ubuntu_targets {
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
    out::message("The configuration applicatio failed on #{$result.error_set.targets}")
  }
}
