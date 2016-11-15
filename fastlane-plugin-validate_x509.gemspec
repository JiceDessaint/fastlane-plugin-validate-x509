# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/validatex509/version'

Gem::Specification.new do |spec|
  spec.name          = 'fastlane-plugin-validate_x509'
  spec.version       = Fastlane::ValidateX509::VERSION
  spec.author        = %q{Jean-Charles DESSAINT}
  spec.email         = %q{jcdessaint@octo.com}

  spec.summary       = %q{Ensure embedded x509 certs are valid for still a certain amount of time}
  # spec.homepage      = "https://github.com/<GITHUB_USERNAME>/fastlane-plugin-validate_x509"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"] + %w(README.md LICENSE)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  # spec.add_dependency 'your-dependency', '~> 1.0.0'

  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'fastlane', '>= 1.105.0'
end
