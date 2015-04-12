# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'quake_log_parser/version'

Gem::Specification.new do |spec|
  spec.name          = "quake_log_parser"
  spec.version       = QuakeLogParser::VERSION
  spec.authors       = ["Icaro Seara"]
  spec.email         = ["icaro.seara@gmail.com"]

  spec.summary       = %q{Quake log parser.}
  spec.description   = %q{Quake log parser.}
  spec.license       = 'MIT'
  spec.homepage      = "https://github.com/icaroseara/quake_log_parse"
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-nc"
  spec.add_development_dependency "rspec-collection_matchers"

  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-remote"
  spec.add_development_dependency "pry-nav"
end
