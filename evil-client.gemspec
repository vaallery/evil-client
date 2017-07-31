Gem::Specification.new do |gem|
  gem.name     = "evil-client"
  gem.version  = "1.0.0"
  gem.author   = ["Andrew Kozin (nepalez)", "Ravil Bairamgalin (brainopia)"]
  gem.email    = ["andrew.kozin@gmail.com", "nepalez@evilmartians.com"]
  gem.homepage = "https://github.com/evilmartians/evil-client"
  gem.summary  = "Human-friendly DSL for building HTTP(s) clients in Ruby"
  gem.license  = "MIT"

  gem.files            = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  gem.test_files       = gem.files.grep(/^spec/)
  gem.extra_rdoc_files = Dir["README.md", "LICENSE", "CHANGELOG.md"]

  gem.required_ruby_version = ">= 2.3"

  gem.add_runtime_dependency "dry-initializer", "~> 1.4"
  gem.add_runtime_dependency "dry-memoizer", "~> 0.0.1"
  gem.add_runtime_dependency "i18n", "~> 0.8.6"
  gem.add_runtime_dependency "mime-types", "~> 3.1"
  gem.add_runtime_dependency "rack", "~> 1"

  gem.add_development_dependency "rake", ">= 10"
  gem.add_development_dependency "rspec", "~> 3.0"
  gem.add_development_dependency "rspec-its", "~> 1.2"
  gem.add_development_dependency "rubocop", "~> 0.42"
  gem.add_development_dependency "timecop", "~> 0.9"
  gem.add_development_dependency "webmock", "~> 2.1"
end
