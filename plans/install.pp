#
plan helixalm_bolt::install (
  TargetSpec $targets,
  Array[String] $ubuntu_packages = ['apache2', 'libharfbuzz-dev', 'libxrender1', 'libxcomposite-dev', 'libapache2-mod-cgi', 'libgl1-mesa-glx', 'libharfbuzz0b', 'libbz2-1.0', 'libgtk2.0-0', 'libpangox-1.0-0', 'libpangoxft-1.0-0', 'libidn11', 'gstreamer1.0-plugins-base', 'gstreamer1.0-plugins-good', 'gstreamer1.0-libav', 'libxcb-icccm4', 'libxcb-image0', 'libxcb-keysyms1', 'libxcb-render-util0', 'libxcb-shape0', 'libxcb-xinerama0', 'libxcb-xkb1', 'libxcb-xinput0', 'libxkbcommon-x11-0'],
) {

  apply_prep($targets)

  # This collects facts on targets and updates the inventory
  run_plan('facts', 'targets' => $targets)

  $ubuntu_targets = get_targets($targets).filter |$n| { $n.facts['os']['name'] == 'Ubuntu' }
  $failed_targets = get_targets($targets).filter |$n| { $n.facts['os']['name'] != 'Ubuntu' }

  $apply_result = apply($ubuntu_targets){
    package { $ubuntu_packages: 
      ensure => installed,
    }

    exec { 'apache_mod':
      command => ['/usr/sbin/a2enmod', 'cgi'],
      require => Package[$ubuntu_packages],
    }

    service { 'apache2':
      ensure    => running,
      subscribe => Exec['apache_mod'], 
    }
  }

  # Let users know which targets failed python install
  # This is an example of a conditional
  unless $apply_result.ok {
      out::message("Installing packages failed on #{$result.error_set.targets}")
  }
}
