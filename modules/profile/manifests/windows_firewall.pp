# Enables all profiles
class profile::windows_firewall {
  windows_firewall_profile { ['domain', 'private', 'public']:
    filename                   => '%systemroot%\\system32\\logfiles\\firewall\\pfirewall.log',
    firewallpolicy             => 'blockinbound,allowoutbound',
    inboundusernotification    => 'disable',
    logallowedconnections      => 'disable',
    logdroppedconnections      => 'enable',
    maxfilesize                => '4096',
    state                      => 'on',
    unicastresponsetomulticast => 'disable', 
  }

# Purge all existing Rules, allow only what Puppet manages.
  #resources { "windows_firewall_rule":
   # purge => true,
  #}

# Custom Rules
# Set The default_params for the individual rules. 
  $default_individual_firewall_rules = {
    'ensure'                => present,
    'action'                => "allow",
    'profile'               => ["private", "domain", "public"],
    'direction'             => 'inbound',
    'edge_traversal_policy' => 'block',
    'enabled'               => 'true',
    'interface_type'        => ['any'],
    'local_address'         => 'any',
    'remote_address'        => 'any',
  }
  # Merge strategy deep zorgt er voor dat er meerdere waarden uit Hiera gehaald kunnen worden. 
  # De default strategy stopt bij de eerste waarde (in dit geval een regel) die hij vindt. 
  # Door met de deep strategy te werken zullen alle relevante regels ingeladen worden. 
  $individual_firewall_rules = lookup({ 'name' => 'windows::firewall::individual_firewall_rules',
                                'merge' => {
                                  'strategy'           => 'deep',
                                  'knockout_prefix'    => '--',
                                  'sort_merged_arrays' => false,
                                  'merge_hash_arrays'  => false,
				},
				'default_value' => {}
			})
  if $individual_firewall_rules != undef {
    create_resources('windows_firewall_rule', $individual_firewall_rules, $default_individual_firewall_rules)
	}
}

