$:.push File.expand_path("./lib")

require "rubygems"
require "rocx"
require "rake"
require "bundler/gem_tasks"
require "rake/testtask"

task :install do
  `gem build rocx.gemspec`
  `sudo gem install rocx-#{Rocx::VERSION}.gem`
end

Rake::TestTask.new(:test) do |t|
  t.libs << "lib"
  t.libs << "test"
  t.pattern = "test/**/*_test.rb"
  t.verbose = false
end