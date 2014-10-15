# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-stagebloc/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-stagebloc"
  spec.version       = Omniauth::Stagebloc::VERSION
  spec.authors       = ["Baylor Rae'"]
  spec.email         = ["opensource@thecodedeli.com"]
  spec.summary       = %q{OmniAuth strategy for Stagebloc.}
  spec.description   = %q{OmniAuth strategy for Stagebloc.}
  spec.homepage      = "http://github.com/TheCodeDeli/omniauth-stagebloc"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.1.0"

  spec.add_dependency 'omniauth', '~> 1.2'
  spec.add_dependency 'omniauth-oauth2', '~> 1.0.3'

end
