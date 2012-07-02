scratch_files = FileList['**/*~', '**/*.bak']
clobber_files = FileList['*.gem', '.bundle/', '.yardoc/', '_site/', 'coverage/',
  'doc/', 'pkg/', 'rerun.txt', 'tmp/']

namespace :clean do
  desc "Remove any scratch and backup files"
  task :scratch do
    remove_files(scratch_files)
  end

  desc "Remove any generated and temporary files"
  task :clobber do
    remove_files(clobber_files)
  end

  desc "Clean all scratch and clobber files"
  task all: [:scratch, :clobber]
end

desc "Alias for clean:all"
task clean: 'clean:all'

private

def remove_files(files)
  files.each do |file|
    if File.exists?(file)
      rm_rf(file, verbose: false)
      puts "Removed #{file}"
    end
  end
end
