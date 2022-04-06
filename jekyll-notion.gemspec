# frozen_string_literal: true

require_relative "lib/jekyll/notion/version"

Gem::Specification.new do |spec|
  spec.name = "jekyll-notion"
  spec.version = Jekyll::Notion::VERSION
  spec.authors = ["Joshua Jarvis"]
  spec.email = ["jjarvis@hey.com"]

  spec.summary = "This gem converts notion pages into Jekyll Posts"
  spec.description = "Simple gem that takes a Notion page URL and genenrates a Jekyll post."
  spec.homepage = "https://github.com/bynarlogic/jekyll-notion"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "jekyll", ">= 3.7"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
