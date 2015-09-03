# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'enum/version'

Gem::Specification.new do |spec|
  spec.name          = "enum_for_what"
  spec.version       = EnumForWhat::VERSION
  spec.authors       = ["Chris Arcand", "Nick Pohodnya", "Aaron Weiner"]
  spec.email         = ["chris.arcand@sportngin.com"]

  spec.summary       = %q{MySQL's native ENUM type for Rails}
  spec.description   = %q{Allows your Rails models and views to take advantage of MySQL's' native ENUM type
Originally forked from various forks of https://github.com/electronick/enum_column}
  spec.homepage      = "https://github.com/sportngin/enum_for_what"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end

