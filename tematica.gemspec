$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'tematica/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'tematica'
  s.version     = Tematica::VERSION
  s.authors     = ['Fernan2 & jguitar - Rankia']
  s.email       = ['fernando@rankia.com']
  s.homepage    = 'https://github.com/Soluciones/tematica'
  s.summary     = 'Permite gestionar temáticas y asignarlas a otras clases.'
  s.description = ''

  s.files = Dir['{app,config,db,lib}/**/*'] + ['MIT-LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '~> 4.2'
  s.add_dependency 'inherited_resources'
  s.add_dependency 'haml'
  s.add_dependency 'simple_form'
end
