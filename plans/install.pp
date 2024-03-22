#
plan helixalm_bolt::install (
  TargetSpec $targets,
  Array[String] $ubuntu_packages = ['apache2', 'libharfbuzz-dev', 'libxrender1', 'libxcomposite-dev', 'libgl1-mesa-glx', 'libharfbuzz0b', 'libbz2-1.0', 'libgtk2.0-0', 'libpangox-1.0-0', 'libpangoxft-1.0-0', 'libidn11', 'gstreamer1.0-plugins-base', 'gstreamer1.0-plugins-good', 'gstreamer1.0-libav', 'libxcb-icccm4', 'libxcb-image0', 'libxcb-keysyms1', 'libxcb-render-util0', 'libxcb-shape0', 'libxcb-xinerama0', 'libxcb-xkb1', 'libxcb-xinput0', 'libxkbcommon-x11-0'],
) {
  # Require the apply_prep to use the apply block
  apply_prep($targets)

  # This collects facts on targets and updates the inventory
  run_plan('facts', 'targets' => $targets)

  $ubuntu_targets = get_targets($targets).filter |$n| { $n.facts['os']['name'] == 'Ubuntu' }
  $failed_targets = get_targets($targets).filter |$n| { $n.facts['os']['name'] != 'Ubuntu' } # Should return this list as unsupported OS

  # Puppet apply
  $apply_result = apply($ubuntu_targets){
    package { $ubuntu_packages: 
      ensure => installed,
    }

    exec { 'apache_mod':
      command => ['/usr/sbin/a2enmod', 'cgi'],
      require => Package[$ubuntu_packages],
    }

    file { '/etc/apache2/apache2.conf':
      ensure  => file,
      content => file('helixalm_bolt/apache2.conf'),
    }

    service { 'apache2':
      ensure    => running,
      subscribe => Exec['apache_mod'], 
    }
  }

  # Handle errors from the apply block
  unless $apply_result.ok {
      out::message("The configuration applicatio failed on #{$result.error_set.targets}")
  }
}
