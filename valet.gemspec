require File.expand_path('../lib/valet/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = 'valet'
  gem.version       = Valet::VERSION::STRING
  gem.authors       = ['Alexander Baumann']
  gem.email         = ['alexander.baumann@arclight.ch']
  gem.homepage      = 'http://gitkeeper.github.com/valet'
  gem.description   = 'A framework for creating GNU compliant command-line interfaces.'
  gem.summary       = <<-EOF.gsub(/^\s{4}/, '').gsub(/\n/, ' ').strip
    Valet helps you write the sophisticated command-line interfaces you're so
    used to from GNU/Linux. It provides a beautiful API, template support,
    man page generator, and many other useful features. No matter how large or
    complex your application is, Valet tops it off with the command-line
    interface it deserves.
  EOF

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(spec|features)/})
  gem.require_paths = ['lib']

  gem.add_development_dependency 'rake',          '~> 0.9'
  gem.add_development_dependency 'rspec',         '~> 2.10'
  gem.add_development_dependency 'cucumber',      '~> 1.2'
  gem.add_development_dependency 'aruba',         '~> 0.4'
  gem.add_development_dependency 'simplecov',     '~> 0.6'
  gem.add_development_dependency 'yard',          '~> 0.8'
  gem.add_development_dependency 'yard-cucumber', '~> 2.2'
  gem.add_development_dependency 'redcarpet',     '~> 2.1'
end
