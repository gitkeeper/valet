# frozen_string_literal: true

require "thor"
require "rake"

# Namespace for classes and modules in Valet
#
# @author Alexander Baumann
# @since 0.1.0
module Valet
  def self.exit_on_failure?
    true
  end

  # Command-line interface that is powered by Thor and Rake
  #
  # @author Alexander Baumann
  # @since 0.2.0
  class CLI < Thor
    FORMAT_TIMESTAMP = "%y%m%d_"

    desc "prefix --options PREFIX FILES",
         "Prepends a prefix to the filenames of a set of files"
    option(:verbose, aliases: :v, type: :boolean)
    option(:"dry-run", aliases: :n, type: :boolean)
    option(:timestamp, aliases: :t, type: :boolean)
    def prefix(prefix, *files)
      prefix_orig = prefix.freeze

      FileList[files].each do |src|
        next if File.directory?(src)

        prefix = combine_timestamp(src, prefix_orig) if options[:timestamp]

        FileUtils.mv(src, combine_dest(src, prefix),
                     noop: options[:"dry-run"], verbose: options[:verbose])
      end
    end

    private

    def combine_timestamp(src, prefix)
      prefix + File.mtime(src).strftime(FORMAT_TIMESTAMP)
    end

    def combine_dest(src, prefix)
      File.join(File.dirname(src), prefix + File.basename(src))
    end
  end
end
