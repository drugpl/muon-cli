# -*- encoding: utf-8 -*-
require File.expand_path('../lib/muon-cli/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Piotr Niełacny"]
  gem.email         = ["piotr.nielacny@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "muon-cli"
  gem.require_paths = ["lib"]
  gem.version       = Muon::CLI::VERSION

  gem.add_dependency('chronic_duration')
  gem.add_dependency('gli')
  gem.add_dependency('faraday')
  gem.add_dependency('json')
  gem.add_dependency('faraday_middleware')
end
