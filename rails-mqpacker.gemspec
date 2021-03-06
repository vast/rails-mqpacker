# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails-mqpacker/version'

Gem::Specification.new do |spec|
  spec.name          = "rails-mqpacker"
  spec.version       = RailsMqpacker::VERSION
  spec.authors       = ["Vasily Polovnyov"]
  spec.email         = ["vasily@polovnyov.ru"]
  spec.summary       = %q{CSS post-processor which packs same media queries into one media query rule}
  spec.description   = spec.summary
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "execjs"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
