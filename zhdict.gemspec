$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "zhdict/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "zhdict"
  s.version     = Zhdict::VERSION
  s.authors     = ["Brad Chase"]
  s.email       = ["brad@webappfromscratch.com"]
  s.summary     = %q{A Ruby gem to interface with CEDict}
  s.description = %q{A Ruby gem to interface with CEDict}
  s.homepage    = "http://github.com/bchase/zhdict"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  # s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.0"

  # s.add_development_dependency "sqlite3"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'ammeter'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'pry'

  # spec.files         = `git ls-files -z`.split("\x0")
  # spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  # spec.require_paths = ["lib"]

  # spec.add_runtime_dependency "activerecord"

  # spec.add_development_dependency "bundler", "~> 1.5"
  # spec.add_development_dependency "rake"
end
