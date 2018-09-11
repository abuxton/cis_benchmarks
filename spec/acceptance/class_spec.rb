require 'spec_helper_acceptance'

hosts_as('agent').each do |client|

describe 'cis_benchmarks class' do
  context 'default parameters' do
    # Using puppet_apply as a helper
    it 'should work idempotently with no errors' do
      pp = <<-EOS
      class { 'cis_benchmarks': }
      EOS

      # Run it twice and test for idempotency
      #1.The first execution does create the script directory and drops the files
      # which means that facter was not able to execute the bash scripts but still made some changes
      execute_manifest_on(client ,pp,{:catch_failures => true})
      #2. The second execution executed the bash scripts and also some other puppet code
      #   if there are some rules disabled then some bash scripts will not be invoked
      execute_manifest_on(client, pp,{:catch_failures => true})
      #3. this should not expect any changes
      execute_manifest_on(client, pp,{:catch_changes  => true})
    end

    #describe package('cis_benchmarks') do
    #  it { is_expected.to be_installed }
    #end

    #describe service('cis_benchmarks') do
    #  it { is_expected.to be_enabled }
    #  it { is_expected.to be_running }
    #end
  end
end

end
