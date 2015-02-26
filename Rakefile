require "bundler/gem_tasks"
require "rake/testtask"

$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "quantified/version"

task default: :test

desc 'Run the test suite'
Rake::TestTask.new do |t|
  t.libs << "test"
  t.libs << "lib/**/*"
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
end

task tag: :build do
  system "git commit -m'Released version #{ Quantified::VERSION }' --allow-empty"
  system "git tag -a v#{ Quantified::VERSION } -m 'Tagging #{ Quantified::VERSION }'"
  system "git push --tags"
end
