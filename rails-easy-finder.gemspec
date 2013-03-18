# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails-easy-finder/version'

Gem::Specification.new do |gem|
  gem.name          = 'rails-easy-finder'
  gem.version       = Rails::Easy::Finder::VERSION
  gem.authors       = ['Benjamin Falk']
  gem.email         = %w(benjamin.falk@yahoo.com)
  gem.description   = %q{Simple way to write complex chained model scopes together}
  gem.summary       = %q{Simple way to write complex chained model scopes together}
  gem.homepage      = 'https://github.com/benfalk/rails-easy-finder'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = %w(lib)

  gem.add_dependency 'active_support', ['>= 3.0']

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'cucumber'
end
