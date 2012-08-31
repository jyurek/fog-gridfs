# -*- encoding: utf-8 -*-
require File.expand_path('../lib/fog-gridfs/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jon Yurek"]
  gem.email         = ["jyurek@thoughtbot.com"]
  gem.description   = %q{Allows fog to use gridfs as a storage backend.}
  gem.summary       = %q{gridfs for fog}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "fog-gridfs"
  gem.require_paths = ["lib"]
  gem.version       = Fog::Gridfs::VERSION

  gem.add_dependency('fog')
  gem.add_dependency('mongo')
  gem.add_dependency('bson_ext')
  gem.add_development_dependency('rake')
  gem.add_development_dependency('rspec')
  gem.add_development_dependency('simplecov')
  gem.add_development_dependency('pry')
end
