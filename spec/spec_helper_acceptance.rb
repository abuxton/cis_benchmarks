require 'beaker-rspec/spec_helper'
require 'beaker-rspec/helpers/serverspec'
require 'beaker/puppet_install_helper'

run_puppet_install_helper unless ENV['BEAKER_provision'] == 'no'
on hosts[0],"sudo mkdir /opt/tmp" unless ENV['BEAKER_provision'] == 'no'

RSpec.configure do |c|
  # Project root
  proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))

  # Readable test descriptions
  c.formatter = :documentation

  # Configure all nodes in nodeset
  c.before :suite do
    # Install module and dependencies
    puppet_module_install(:source => proj_root, :module_name => 'cis_benchmarks', :ignore_list => ['metadata.json','data','hiera.yaml','examples','spec','log','junit','tmp','coverage'])

    hosts.each do |host|
      on host, puppet('module', 'install', 'puppetlabs-stdlib'), { :acceptable_exit_codes => [0,1] }
      on host, puppet('module', 'install', 'puppetlabs-concat'), { :acceptable_exit_codes => [0,1] }
      on host, puppet('module', 'install', 'fiddyspence-sysctl'), { :acceptable_exit_codes => [0,1] }
      on host, puppet('module', 'install', 'kemra102-auditd'), { :acceptable_exit_codes => [0,1] }

      #on host, 'puppet module install herculesteam-augeasproviders_core --ignore-dependencies'
      #on host, 'puppet module install herculesteam-augeasproviders_pam --ignore-dependencies'
      on host, puppet('module', 'install', 'herculesteam-augeasproviders_core'), { :acceptable_exit_codes => [0,1] }
      on host, puppet('module', 'install', 'herculesteam-augeasproviders_pam'), { :acceptable_exit_codes => [0,1] }
      scp_to(host,'./data','/tmp/data' )
      scp_to(host,'hiera.yaml','/etc/puppetlabs/puppet')
    end
  end
end
