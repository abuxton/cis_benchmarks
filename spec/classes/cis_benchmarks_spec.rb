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
end
