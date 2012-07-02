require 'rspec/core/rake_task'

default_opts = ['--format progress', '--color']

namespace :spec do
  desc "Run all specs"
  RSpec::Core::RakeTask.new(:all) do |t|
    t.rspec_opts = [*default_opts]
  end

  desc "Run all specs that should pass"
  RSpec::Core::RakeTask.new(:ok) do |t|
    t.rspec_opts = [*default_opts, '--tag ~wip']
  end

  desc "Run specs that are being worked on"
  RSpec::Core::RakeTask.new(:wip) do |t|
    t.rspec_opts = [*default_opts, '--tag wip']
  end

  desc "Run all specs and show the ten slowest examples"
  RSpec::Core::RakeTask.new(:profile) do |t|
    t.rspec_opts = [*default_opts, '--profile', '--tag ~wip']
  end
end

desc "Alias for spec:ok"
task spec: 'spec:ok'
