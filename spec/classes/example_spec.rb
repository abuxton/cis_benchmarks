require 'spec_helper'

describe 'mtn_cis' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "mtn_cis class without any parameters" do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('mtn_cis::params') }
          it { is_expected.to contain_class('mtn_cis::install').that_comes_before('mtn_cis::config') }
          it { is_expected.to contain_class('mtn_cis::config') }
          it { is_expected.to contain_class('mtn_cis::service').that_subscribes_to('mtn_cis::config') }

          it { is_expected.to contain_service('mtn_cis') }
          it { is_expected.to contain_package('mtn_cis').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'mtn_cis class without any parameters on Solaris/Nexenta' do
      let(:facts) do
        {
          :osfamily        => 'Solaris',
          :operatingsystem => 'Nexenta',
        }
      end

      it { expect { is_expected.to contain_package('mtn_cis') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
