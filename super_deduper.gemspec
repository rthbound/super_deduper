# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'super_deduper/version'

Gem::Specification.new do |spec|
  spec.name          = "super_deduper"
  spec.version       = SuperDeduper::VERSION
  spec.authors       = ["Tad Hosford"]
  spec.email         = ["tad.hosford@gmail.com"]
  spec.description   = %q{"Checks an array of strings against records in the specified table & column. It's a super deduper."}
  spec.summary       = %q{"It's a super deduper."}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "pay_dirt"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end