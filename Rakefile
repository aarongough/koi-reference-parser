require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

desc 'Default: run unit tests.'
task :default => :test

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "koi-reference-parser"
    gemspec.summary = "A reference parser for the Koi language."
    gemspec.description = "A reference parser for the Koi language."
    gemspec.email = "aaron@aarongough.com"
    gemspec.homepage = "http://github.com/aarongough/koi-reference-parser"
    gemspec.authors = ["Aaron Gough"]
    gemspec.rdoc_options << '--line-numbers' << '--inline-source'
    gemspec.extra_rdoc_files = ['README.rdoc', 'MIT-LICENSE']
    gemspec.add_dependency('treetop')
  end
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end


desc 'Test koi-reference-parser.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib/*.rb'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end


desc 'Generate documentation for koi-reference-parser.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'koi-reference-parser'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
  rdoc.rdoc_files.include('app/**/*.rb')
end