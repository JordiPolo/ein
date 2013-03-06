# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ein/version'

Gem::Specification.new do |gem|
  gem.name          = "ein"
  gem.version       = Ein::VERSION
  gem.authors       = ["Jordi Polo Carres"]
  gem.email         = ["mumismo@gmail.com"]
  gem.description   = %q{Very simple 2D physics simulator}
  gem.summary       = %q{Very simple 2D physics simulator}
  gem.homepage      = "https://github.com/jordiPolo/ein"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
