require 'yard'

namespace :yard do
  YARD::Rake::YardocTask.new(:update) do |t|
    t.files = ['lib/**/*.rb', 'features/**/*.rb', 'features/**/*.feature']
    t.options = [
      '--markup',  'markdown',
      '--charset', 'utf-8',
      '--title',   "Valet #{Valet::VERSION::STRING}",
      '--files',   'LICENSE,CHANGELOG.md'
    ]
  end

  desc "Remove all YARD Documentation"
  task :clean do
    doc_files = FileList['.yardoc/', 'doc/']
    remove_files(doc_files)
  end

  desc "Create new YARD Documentation"
  task create: [:clean, :update]
end

desc "Alias for yard:update"
task yard: 'yard:update'

private

def remove_files(files)
  files.each do |file|
    if File.exists?(file)
      rm_rf(file, verbose: false)
      puts "Removed #{file}"
    end
  end
end
