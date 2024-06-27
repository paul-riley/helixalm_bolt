# @summary Configures the webserver, firewall, and selinux type.
# This does a complete system configuration prior to running the Helix ALM install.
#  The HelixALM install is not parameterized because it requires input of the parameters on the install.
# @example
#   include helixalm
# @param webserver_type = String for package name for webserver_type usually either httpd or apache2
# @param webserver_config_file = String for the location of the webserver configuration file
# @param required_packages = Hash of Strings for the required packages to install HelixALM
# @param firewall_config = Hash of firewall_configuration data
# @param selinux_config  = Optional Hash of the mode for selinux. Generally used with EL systems.
class helixalm (
  String $webserver_type,
  String $webserver_config_file,
  Hash[String] $required_packages,
  Hash $firewall_config,
  Optional[Hash] $selinux_config,
) {
  package { $required_packages:
    ensure => installed,
  }

  package { $webserver_type:
    ensure => installed,
  }

  if $facts['os']['family'] == 'RedHat' {
    require firewalld
    firewalld_port { $firewall_config.firewalld_name :
      ensure   => $firewall_config.ensure,
      zone     => $firewall_config.zone,
      port     => $firewall_config.port,
      protocol => $firewall_config.protocol,
    }

    class { 'selinux':
      mode    => $selinux_config.mode,
      require => [Package[$required_packages],Package[$webserver_type]],
      notify  => Service[$webserver_type],
    }
  }

  if $facts['os']['name'] == 'Ubuntu' {
    require firewall
    firewall { $firewall_config.iptables_name :
      proto => $firewall_config.protocol,
      dport => $firewall_config.port,
      jump  => $firewall_config.jump,
    }

    exec { 'apache_mod':
      command => ['/usr/sbin/a2enmod', 'cgi'],
      require => [Package[$required_packages],Package[$webserver_type]],
    }

    file { $webserver_config_file :
      ensure  => file,
      content => file('helixalm/cgi.conf'),
      notify  => Service[$webserver_type],
    }
  }

  service { lookup('webserver_type'):
    ensure  => running,
    require => [Package[$required_packages],Package[$webserver_type]],
  }
}
