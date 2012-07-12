require 'cucumber/rake/task'

CLEAN.include('rerun.txt')

default_opts = ['--format progress', '--color']

namespace :cucumber do
  Cucumber::Rake::Task.new(:all, "Run all features") do |t|
    t.cucumber_opts = [*default_opts]
  end

  Cucumber::Rake::Task.new(:ok, "Run all features that should pass") do |t|
    t.cucumber_opts = [*default_opts, '--strict', '--tags ~@wip']
  end

  Cucumber::Rake::Task.new(:wip, "Run features that are being worked on") do |t|
    t.cucumber_opts = ['--format pretty', '--color', '--wip', '--tags @wip']
  end

  Cucumber::Rake::Task.new(:rerun, "Record and rerun failing features") do |t|
    t.cucumber_opts = [*default_opts, '--strict', '--tags ~@wip',
      '--format rerun', '--out rerun.txt']

    failing_features = File.exists?('rerun.txt') ? File.read('rerun.txt') : ''
    t.cucumber_opts << failing_features unless failing_features.empty?
  end
end

desc "Alias for cucumber:ok"
task cucumber: 'cucumber:ok'
