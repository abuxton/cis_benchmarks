require 'spec_helper_acceptance'

describe 'cis_benchmarks class' do
  context 'default parameters' do
    # Using puppet_apply as a helper
    it 'should work idempotently with no errors' do
      pp = <<-EOS
      class { 'cis_benchmarks': }
      EOS

      # Run it twice and test for idempotency
      apply_manifest(pp,{:hiera_config => '/etc/puppetlabs/puppet/hiera.yaml', :catch_failures => true})
      apply_manifest(pp,{:hiera_config => '/etc/puppetlabs/puppet/hiera.yaml', :catch_changes  => true})
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
