# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'adsniper/api/version'

Gem::Specification.new do |spec|
  spec.name          = "adsniper-api"
  spec.version       = Adsniper::Api::VERSION
  spec.authors       = ["Artur Seletskiy"]
  spec.email         = ["artur2304@mail.ru"]
  spec.description   = %q{Adsniper API}
  spec.summary       = %q{Adsniper API}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.4.0.pre.2"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-expectations"
  #spec.add_development_dependency "factory_girl", "~> 4.0"
  spec.add_development_dependency "rest-client", "~> 1.6.7"
  spec.add_development_dependency "hashie", "~> 2.0.5"
  spec.add_development_dependency "awesome_print"

end
