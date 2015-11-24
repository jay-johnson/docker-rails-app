# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

require 'rake/testtask'

require 'rspec/core/rake_task'
if default = Rake.application.instance_variable_get('@tasks')['default']
  default.prerequisites.delete('test')
end

Rake.application.instance_variable_get('@tasks').delete('db:test:prepare')
namespace 'db' do
  namespace 'test' do
    task 'prepare' do
    end
  end
end

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.pattern = 'test/controllers/*_test.rb'
  t.verbose = false # or true
end


desc "Run Tests"
task :default => :test
