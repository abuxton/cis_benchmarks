require 'spec_helper'

describe 'cis_benchmarks' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "cis_benchmarks class without any parameters" do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('cis_benchmarks::params') }
          it { is_expected.to contain_class('cis_benchmarks::install').that_comes_before('cis_benchmarks::config') }
          it { is_expected.to contain_class('cis_benchmarks::config') }
          it { is_expected.to contain_class('cis_benchmarks::service').that_subscribes_to('cis_benchmarks::config') }

          it { is_expected.to contain_service('cis_benchmarks') }
          it { is_expected.to contain_package('cis_benchmarks').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'cis_benchmarks class without any parameters on Solaris/Nexenta' do
      let(:facts) do
        {
          :osfamily        => 'Solaris',
          :operatingsystem => 'Nexenta',
        }
      end

      it { expect { is_expected.to contain_package('cis_benchmarks') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
