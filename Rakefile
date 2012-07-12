#!/usr/bin/env rake

# Import Bundler's tasks for managing gems
require 'bundler/gem_tasks'

# Create lists for temporary and generated files
CLEAN = FileList['**/*~', '**/*.bak', '.bundle', 'tmp']
CLOBBER = FileList['pkg', '*.gem', 'coverage', '_site']

# Import all project related tasks
Dir.glob('tasks/**/*.rake').each { |task| import task }

# Set Rake's default task
task default: :spec
