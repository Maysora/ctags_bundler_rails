# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name        = 'ctags_bundler_rails'
  s.version     = '1.0.2'
  s.date        = '2013-06-27'
  s.summary     = "Add rake task for generating ctags from bundler"
  s.description = "Add rake task for generating ctags from bundler"
  s.authors     = ["Roy Hadrianoro"]
  s.email       = 'dev@maysora.com'
  s.files       = Dir.glob("lib/**/*.*")
  s.homepage    = 'https://github.com/Maysora/ctags_bundler_rails'
  s.license     = 'MIT'

  s.add_dependency 'bundler', '>= 1.0'
  s.add_dependency 'rails', '>= 3.0'
end