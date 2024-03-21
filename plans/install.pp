# This is the structure of a simple plan. To learn more about writing
# Puppet plans, see the documentation: http://pup.pt/bolt-puppet-plans

# The summary sets the description of the plan that will appear
# in 'bolt plan show' output. Bolt uses puppet-strings to parse the
# summary and parameters from the plan.
# @summary A plan created with bolt plan new.
# @param targets The targets to run on.
plan helixalm_bolt::install (
  TargetSpec $targets = 'localhost',
  Array[String] $required_packages,
  Enum['apache2','www'] $webserver_name,
  String $cgi_file,
) {
  # out::message("Hello from helixalm_bolt::install")
  # $command_result = run_command('whoami', $targets)
  # return $command_result
  $target_objects = get_targets($targets)

  # Short-circuit the plan if the TargetSpec given was empty
  if $target_objects.empty { 
    return ResultSet.new([]) 
  } else {
    $apply_result = apply($target_objects){
      package { $required_packages:
        ensure => installed,
      }
      package { $webserver_name:
        ensure => installed,
      }
    }
  }
}
