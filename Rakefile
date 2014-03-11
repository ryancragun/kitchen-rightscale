require 'bundler/gem_tasks'
require 'cane/rake_task'
require 'tailor/rake_task'
require 'rubocop/rake_task'
require 'rspec'
require 'rspec/core/rake_task'

desc 'Run spec suite'
RSpec::Core::RakeTask.new(:unit) do |task|
  task.pattern = FileList['spec/kitchen/**/*_spec.rb']
end

Rubocop::RakeTask.new do |cop|
  cop.fail_on_error = true
end

desc 'Run cane to check quality metrics'
Cane::RakeTask.new do |cane|
  cane.canefile = './.cane'
end

Tailor::RakeTask.new

desc 'Display LOC stats'
task :stats do
  puts '\n## Production Code Stats'
  sh 'countloc -r lib'
end

desc 'Run all quality tasks'
task quality: %i(cane tailor stats unit rubocop)

task default: [:quality]
