CLEAN ||= FileList['**/*~', '**/*.bak']
CLOBBER ||= FileList.new

desc "Remove any temporary files"
task :clean do
  CLEAN.each { |file| rm_r(file) if File.exists?(file) }
end

desc "Remove any generated files"
task clobber: [:clean] do
  CLOBBER.each { |file| rm_r(file) if File.exists?(file) }
end
