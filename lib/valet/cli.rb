# frozen_string_literal: true

require "thor"
require "rake"

module Valet
  class CLI < Thor
    desc "prefix STRING FILES", "Prepends a string to the filenames of a set of files"
    def prefix(string, *files)
      FileList[files].each do |src|
        next if File.directory?(src)

        dest = File.join(File.dirname(src), string + File.basename(src))

        FileUtils.mv(src, dest)
      end
    end
  end
end
