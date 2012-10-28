# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "hash_with_dot_access/version"

Gem::Specification.new do |s|
  s.name        = "hash_with_dot_access"
  s.version     = HashWithDotAccess::VERSION
  s.authors     = ["caleon"]
  s.email       = ["caleon@gmail.com"]
  s.homepage    = "http://github.com/caleon/hash_with_dot_access"
  s.summary     = %q{Kind of in the same vein as Rails' config method conventions, HashWithDotAccess is used to call for values of hash keys using dot-based method calls instead of hash[:key_name].}
  s.description = %q{Kind of in the same vein as Rails' config method conventions, HashWithDotAccess is used to call for values of hash keys using dot-based method calls instead of hash[:key_name].}

  s.rubyforge_project = "hash_with_dot_access"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'activesupport', '>= 3.1.0'

  s.add_dependency 'schrodingers-cat', '~> 1.0.1'
  s.add_development_dependency 'sqlite3'
end
