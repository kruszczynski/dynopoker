# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "dynopoker/version"

Gem::Specification.new do |s|
  s.name        = "dynopoker"
  s.version     = Dynopoker::VERSION
  s.authors     = ["kubenstein"]
  s.email       = ["kubenstein@gmail.com"]
  s.homepage    = "https://github.com/kubenstein/dynopoker"
  s.summary     = %q{Dynopoker: prevent your heroku dyno from falling asleep}
  s.description = %q{Dynopoker is a gem that will make your ruby based heroku app self pinging system, preventing single dyno from falling asleep}

  s.rubyforge_project = "dynopoker"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
