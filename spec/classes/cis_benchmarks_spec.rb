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
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'cis_benchmarks class without any parameters on Solaris/Nexenta' do
      let(:facts) do
        {
          :os => {
            :name    => 'Solaris',
            :release => {
              :major => '11',
            }
          }
        }
      end

      it { expect { is_expected.to contain_package('cis_benchmarks') }.to raise_error(Puppet::Error, /Solaris 11 not supported yet/) }
    end
  end
end
