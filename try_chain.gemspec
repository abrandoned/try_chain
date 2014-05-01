# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'try_chain/version'

Gem::Specification.new do |gem|
  gem.name          = "try_chain"
  gem.version       = TryChain::VERSION
  gem.authors       = ["Brandon Dewitt"]
  gem.email         = ["brandonsdewitt@gmail.com"]
  gem.description   = %q{ using try that takes an array of chainable try calls }
  gem.summary       = %q{ don't use this unless you really need to use it, it is bad form to have "try all the way down"
                          This was really built for JRuby applications to deal with custom typing in the Java side that
                          requires tons of intermediary objects to actually get to an object that is "usable"
                          (that MIGHT be a good use-case, but probably not) }
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "activesupport", ">= 3.1.0"

  gem.add_development_dependency "bundler", "~> 1.3"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec"
end
