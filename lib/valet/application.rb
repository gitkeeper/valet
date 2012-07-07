module Valet
  module Application
    attr_accessor :name, :version

    def start
      puts "#{name} #{version}"
    end
  end
end
