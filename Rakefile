#!/usr/bin/env rake

# Import Bundler's tasks for managing gems
require 'bundler/gem_tasks'

# Import all project related tasks
Dir.glob('tasks/**/*.rake').each { |task| import task }

# Set Rake's default task
task default: :spec
