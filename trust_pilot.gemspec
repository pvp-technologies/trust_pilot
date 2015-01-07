# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'trust_pilot/version'

Gem::Specification.new do |spec|
  spec.name          = "trust_pilot"
  spec.version       = TrustPilot::VERSION
  spec.authors       = ["Zaratan"]
  spec.email         = ["denis.pasin@koolicar.com"]
  spec.summary       = %q{Gem to access Trust Pilot API.}
  spec.description   = %q{Gem to access Trust Pilot API.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'httparty'
  spec.add_dependency 'activesupport'
  spec.add_dependency 'recursive-open-struct'

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
end
