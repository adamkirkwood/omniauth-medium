# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/medium/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-medium"
  spec.version       = Omniauth::Medium::VERSION
  spec.authors       = ["Adam Kirkwood"]
  spec.email         = ["hello@adamkirkwood.com"]

  spec.summary       = "OmniAuth Strategy for the Medium OAuth2 API"
  spec.description   = "OmniAuth Strategy for the Medium OAuth2 API"
  spec.homepage      = "https://github.com/adamkirkwood/omniauth-medium"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
