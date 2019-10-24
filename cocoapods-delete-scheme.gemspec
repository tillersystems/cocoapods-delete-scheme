# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cocoapods-delete-scheme/gem_version.rb'

Gem::Specification.new do |spec|
  spec.name          = 'cocoapods-delete-scheme'
  spec.version       = CocoapodsDeleteScheme::VERSION
  spec.authors       = ['Julien Di Marco']
  spec.email         = ['juliendimarco@me.com']
  spec.description   = %q{A short description of cocoapods-delete-scheme.}
  spec.summary       = %q{A longer description of cocoapods-delete-scheme.}
  spec.homepage      = 'https://github.com/tillersystems/cocoapods-delete-scheme'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
