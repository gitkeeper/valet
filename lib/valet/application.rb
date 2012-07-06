module Valet
  module Application
    attr_accessor :name, :version, :copyright, :license

    def start
      puts "#{name} #{version}"
      puts "#{copyright}"
      puts "#{license}"
    end
  end
end
