$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "damselfly/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "damselfly"
  s.version     = Damselfly::VERSION
  s.authors     = ["Rodrigo Alvarez"]
  s.email       = ["papipo@gmail.com"]
  s.homepage    = "https://github.com/Papipo/damselfly"
  s.summary     = "Rails engine to add polymorphic file attachments leveraging dragonfly and counting references to avoid duplicates."
  s.description = "Rails engine to add polymorphic file attachments leveraging dragonfly and counting references to avoid duplicates.."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.13"

  s.add_development_dependency "pg"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "spork"
  s.add_development_dependency "guard-spork"
end
