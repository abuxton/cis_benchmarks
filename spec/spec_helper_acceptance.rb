require 'beaker-puppet'
require 'puppet'
require 'beaker-rspec'
require 'beaker/puppet_install_helper'
require 'beaker/testmode_switcher'
require 'beaker/testmode_switcher/dsl'

#stop firewall on all hosts(only on master/agent setup)
#on hosts, "sudo systemctl stop firewalld" unless ENV['BEAKER_provision'] == 'no'
#installing puppet master and agent on host. check README for beaker testing
run_puppet_install_helper unless ENV['BEAKER_provision'] == 'no'

RSpec.configure do |c|
  # Project root
  # Readable test descriptions
  c.formatter = :documentation

  # Configure all nodes in nodeset
  c.before :suite do
    # Install module and dependencies
    hosts.each do |host|
      proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
      puppet_module_install_on(master,:source => proj_root, :module_name => 'cis_benchmarks', :ignore_list => ['metadata.json','data','hiera.yaml','examples','spec','log','junit','tmp','coverage'])
      on host, "yum update -y"
      on host, puppet('module', 'install', 'puppetlabs-stdlib'), { :acceptable_exit_codes => [0,1] }
      on host, puppet('module', 'install', 'puppetlabs-concat'), { :acceptable_exit_codes => [0,1] }
      on host, puppet('module', 'install', 'fiddyspence-sysctl'), { :acceptable_exit_codes => [0,1] }
      on host, puppet('module', 'install', 'kemra102-auditd'), { :acceptable_exit_codes => [0,1] }
      on host, puppet('module', 'install', 'herculesteam-augeasproviders_core'), { :acceptable_exit_codes => [0,1] }
      on host, puppet('module', 'install', 'herculesteam-augeasproviders_pam'), { :acceptable_exit_codes => [0,1] }

      scp_to(host,'./data','/tmp/data' )
      scp_to(host,'hiera.yaml','/etc/puppetlabs/puppet')
   end
  end
end
