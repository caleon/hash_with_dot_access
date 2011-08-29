# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "hash_with_dot_access/version"

Gem::Specification.new do |s|
  s.name        = "hash_with_dot_access"
  s.version     = HashWithDotAccess::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Caleon Chun"]
  s.email       = ["colin@juscribe.com"]
  s.homepage    = "http://www.juscribe.com/u/colin"
  s.summary     = %q{Kind of in the same vein as Rails' config method conventions, HashWithDotAccess is used to call for values of hash keys using dot-based method calls instead of hash[:key_name].}
  s.description = %q{Kind of in the same vein as Rails' config method conventions, HashWithDotAccess is used to call for values of hash keys using dot-based method calls instead of hash[:key_name].}

  s.rubyforge_project = "hash_with_dot_access"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
