require 'yard'

CLEAN.include('.yardoc')
CLOBBER.include('doc')

YARD::Rake::YardocTask.new(:yard) do |t|
  t.files = %w( lib/**/*.rb features/**/*.rb features/**/*.feature )
  t.options = [
    '--markup',  'markdown',
    '--charset', 'utf-8',
    '--title',   "Valet #{Valet::VERSION::STRING}",
    '--files',   'LICENSE,CHANGELOG.md'
  ]
end
