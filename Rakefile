require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint/tasks/puppet-lint'
require 'metadata-json-lint/rake_task'
require 'puppet_blacksmith/rake_tasks'

if RUBY_VERSION >= '1.9'
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new
end

PuppetLint.configuration.send('disable_80chars')
PuppetLint.configuration.relative = true
PuppetLint.configuration.ignore_paths = ['spec/**/*.pp', 'pkg/**/*.pp','tmp/*']

desc 'create new PATCH release, rake clean, rake module:bump_commit:patch, rake module:tag'
task :'release:patch' do
  Rake::Task['clean'].invoke
  Rake::Task['module:bump_commit:patch'].invoke
  Rake::Task['module:tag'].invoke
  Rake::Task['build'].invoke
  puts 'do git push origin v`rake module:version`'
  puts 'do git push'

end
desc 'Validate manifests, templates, and ruby files'
task :validate do
  Dir['manifests/**/*.pp'].each do |manifest|
    sh "puppet parser validate --noop #{manifest}"
  end
  Dir['spec/**/*.rb', 'lib/**/*.rb'].each do |ruby_file|
    sh "ruby -c #{ruby_file}" unless ruby_file =~ %r{spec/fixtures}
  end
  Dir['templates/**/*.erb'].each do |template|
    sh "erb -P -x -T '-' #{template} | ruby -c"
  end
end

desc 'Run metadata_lint, lint, validate, and spec tests.'
task :test do
  [:metadata_lint, :lint, :validate, :spec].each do |test|
    Rake::Task[test].invoke
  end
end
