lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'quantified/version'

Gem::Specification.new do |s|
  s.name        = "quantified"
  s.version     = Quantified::VERSION
  s.license     = 'MIT'
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["James MacAulay", "Willem van Bergen"]
  s.email       = ["james@shopify.com"]
  s.homepage    = "https://github.com/Shopify/quantified"
  s.summary     = "Pretty quantifiable measurements which feel like ActiveSupport::Duration."
  s.description = s.summary

  s.add_development_dependency('rake')
  s.add_development_dependency('test-unit')

  s.files        = `git ls-files`.split($/)
  s.executables  = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.test_files   = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['lib']
end
