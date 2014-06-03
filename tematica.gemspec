# coding: UTF-8

$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "tematica/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "tematica"
  s.version     = Tematica::VERSION
  s.authors     = ["Fernan2 & jguitar - Rankia"]
  s.email       = ["fernando@rankia.com"]
  s.homepage    = "https://github.com/Soluciones/tematica"
  s.summary     = "Permite gestionar temáticas y asignarlas a otras clases."
  s.description = ""

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.markdown"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'rails', '~> 4.0.4'

  s.add_development_dependency 'pg'
  s.add_development_dependency 'rspec-rails', '~> 2.14.2'
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'factory_girl_rails'
end
