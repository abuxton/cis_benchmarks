require 'puppetlabs_spec_helper/module_spec_helper'
require 'rspec-puppet-facts'

include RspecPuppetFacts

#require 'hiera'
require 'simplecov'
require 'simplecov-console'

SimpleCov.start do
  add_filter '/spec'
  add_filter '/vendor'
  formatter SimpleCov::Formatter::MultiFormatter.new([
    SimpleCov::Formatter::HTMLFormatter,
    SimpleCov::Formatter::Console
  ])
end

#Hiera.logger = 'console'

RSpec.configure do |c|
  #c.before(:each) do
  #  Puppet::Util::Log.level = :debug
  #  Puppet::Util::Log.newdestination(:console)
  #end
  c.hiera_config = 'spec/fixtures/hiera.yaml'

  c.after(:suite) do
    RSpec::Puppet::Coverage.report!
  end
end
