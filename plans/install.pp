#
plan helixalm_bolt::install (
  TargetSpec $targets,
) {
  # Require the apply_prep to use the apply block
  apply_prep($targets)

  # This collects facts on targets and updates the inventory
  run_plan('facts', 'targets' => $targets)

  $ubuntu_targets = get_targets($targets).filter |$n| { $n.facts['os']['name'] == 'Ubuntu' }
  $failed_targets = get_targets($targets).filter |$n| { $n.facts['os']['name'] != 'Ubuntu' } # Should return this list as unsupported OS

  # Puppet apply
  $apply_result = apply($ubuntu_targets){
    package { lookup('required_packages'): 
      ensure => installed,
    }
    package { lookup('webserver_type'):
      ensure => installed,
    }

    exec { 'apache_mod':
      command => ['/usr/sbin/a2enmod', 'cgi'],
      require => [Package[lookup('required_packages')],Package[lookup('webserver_type')]],
    }

    file { lookup('webserver_config_file'):
      ensure  => file,
      content => file('helixalm_bolt/' + lookup('webserver_type') + '.conf'),
    }

    service { lookup('webserver_type'):
      ensure    => running,
      subscribe => Exec['apache_mod'],
    }
  }

  # Handle errors from the apply block
  unless $apply_result.ok {
    out::message("The configuration applicatio failed on #{$result.error_set.targets}")
  }
}
