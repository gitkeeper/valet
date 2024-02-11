# frozen_string_literal: true

require_relative "lib/valet/version"

Gem::Specification.new do |spec|
  spec.name          = "valet"
  spec.version       = Valet::VERSION
  spec.authors       = ["Alexander Baumann"]
  spec.email         = ["alexander.baumann@bluewin.ch"]

  spec.summary       = "Valet is your humble servant for everyday office tasks."
  spec.description   = <<~DESCRIPTION
    Valet is a command line tool that provides helpful commands for all sorts of
    daily routine tasks in an office environment.
  DESCRIPTION
  spec.homepage      = "https://github.com/gitkeeper/valet"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 3.3.0")

  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["rubygems_mfa_required"] = "true"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/gitkeeper/valet"
  spec.metadata["changelog_uri"] = "https://github.com/gitkeeper/valet/blob/main/CHANGELOG.md"
  spec.metadata["bug_tracker_uri"] = "https://github.com/gitkeeper/valet/issues"
  spec.metadata["wiki_uri"] = "https://github.com/gitkeeper/valet/wiki"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.extra_rdoc_files = ["README.md"]

  spec.add_runtime_dependency "rake", "~> 13.0"
  spec.add_runtime_dependency "thor", "~> 1.2"
end
