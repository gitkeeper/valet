# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

require "rubocop/rake_task"

RuboCop::RakeTask.new do |task|
  task.requires << "rubocop-rake"
  task.requires << "rubocop-rspec"
end

require "cucumber"
require "cucumber/rake/task"

Cucumber::Rake::Task.new(:features) do |task|
  task.cucumber_opts = ["--format pretty", "--publish-quiet"]
end

task default: %i[spec rubocop]
