# frozen_string_literal: true

# Gem tasks
require "bundler/gem_tasks"

CLOBBER.include(%w[doc pkg .yardoc])
CLEAN.include(%w[coverage tmp .rspec_status])

# Rubocop tasks
require "rubocop/rake_task"

RuboCop::RakeTask.new do |task|
  task.requires << "rubocop-rake"
  task.requires << "rubocop-rspec"
end

# RSpec tasks
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec) do |task|
  task.rspec_opts = %w[--require spec_helper --format documentation
                       --order random --warnings --color]
end

# Cucumber and Aruba tasks
require "cucumber"
require "cucumber/rake/task"

Cucumber::Rake::Task.new(:features) do |task|
  task.cucumber_opts = ["--format pretty", "--publish-quiet"]
end

# YARD tasks
require "yard"

YARD::Rake::YardocTask.new do |task|
  task.files = %w[lib/**/*.rb
                  - CHANGELOG.md CODE_OF_CONDUCT.md LICENSE.md README.md]
  task.options = ["--markup", "markdown", "--no-private", "--protected",
                  "--title", "Valet Documentation"]
end

# Default task
task default: %i[spec rubocop]
