# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kitchen/driver/rightscale_vagrant_version'
require 'base64'

Gem::Specification.new do |spec|
  spec.name          = 'kitchen-rightscale'
  spec.version       = Kitchen::Driver::RIGHTSCALE_VAGRANT_VERSION
  spec.authors       = ['Ryan Cragun']
  encoded_email      = %w(cnlhbkByaWdodHNjYWxlLmNvbQ==)
  spec.email         = encoded_email.map { |e| Base64.decode64(e) }
  description        = %q{A Test Kitchen Driver and Vagrant Provisioner for }
  description        << %q{Rightscale RightImages}
  spec.description   = description
  spec.summary       = spec.description
  spec.homepage      = 'https://www.github.com/ryancragun/kitchen-rightscale'
  spec.license       = 'Apache 2.0'

  spec.files         = `git ls-files`.split($RS)
  spec.executables   = []
  spec.test_files    = spec.files.grep(/^(test|spec|features)/)
  spec.require_paths = ['lib']

  spec.add_dependency 'test-kitchen', '~> 1.2.1'
  spec.add_dependency 'kitchen-vagrant', '~> 0.14.0'

  spec.add_development_dependency 'bundler', '>= 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'

  spec.add_development_dependency 'cane'
  spec.add_development_dependency 'tailor'
  spec.add_development_dependency 'countloc'
  spec.add_development_dependency 'pry-rescue'
  spec.add_development_dependency 'rubocop'
end
