# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "simple_error_wrapper/version"

Gem::Specification.new do |s|
  
  s.name        = 'simple_error_wrapper'
  s.version     = SimpleErrorWrapper::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Tyralion']
  s.email       = ['info@dancingbytes.ru']
  s.homepage    = 'https://github.com/dancingbytes/simple_error_wrapper'
  s.summary     = 'Simple wrapper for rails errors'
  s.description = 'Simple wrapper for rails errors'

  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.extra_rdoc_files = ['README']
  s.require_paths = ['lib']

  s.licenses = ['MIT']

  s.add_dependency 'railties', ['>= 3.0.0']
  
end
