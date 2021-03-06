# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "very_nice_menu/version"

Gem::Specification.new do |s|
  s.name        = "very_nice_menu"
  s.version     = VeryNiceMenu::VERSION
  s.authors     = ["Julian Fischer"]
  s.email       = ["fischer@enterprise-rails.de"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "very_nice_menu"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_development_dependency "rspec"
  s.add_development_dependency "factory_girl"
end
