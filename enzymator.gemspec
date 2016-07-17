# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'enzymator/version'

Gem::Specification.new do |s|
  s.name        = 'enzymator'
  s.version     = Enzymator::Version
  s.date        = '2016-07-17'
  s.summary     = "An extremely simple and powerful aggregation framework"
  s.description = "A gem to perform any kind of calculation on any kind of data. The essence of MapReduce distilled in a few lines of code for the ruby community to enjoy."
  s.authors     = ["Eugenio Bruno"]
  s.email       = 'eugeniobruno@gmail.com'
  s.homepage    = 'http://rubygems.org/gems/enzymator'
  s.license     = 'MIT'

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['lib']

end