require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-syntax/tasks/puppet-syntax'
require 'puppet_blacksmith/rake_tasks'

desc 'create new PATCH release, rake clean, rake module:bump_commit:patch, rake module:tag'
task :'release:patch' do
  Rake::Task['clean'].invoke
  Rake::Task['module:bump_commit:patch'].invoke
  Rake::Task['module:tag'].invoke
  Rake::Task['build'].invoke
  puts 'do git push origin v`rake module:version`'
  puts 'do git push'

end

