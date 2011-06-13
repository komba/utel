# -*- encoding: utf-8 -*-
lib = File.expand_path("../lib/", __FILE__)
$:.unshift lib unless $:.include?(lib)
require "utel/version"

Gem::Specification.new do |s|
  s.name        = "utel"
  s.version     = Utel::VERSION
  s.authors     = ["Eugene Russkikh"]
  s.email       = ["eugene@russkikh.org.ua"]
  s.homepage    = "http://komba.org.ua"
  s.summary     = %q{Utel USSD}
  s.description = %q{Utel USSD services balance checker}


  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
