module CLIHelper
  class CLI
    def initialize(content = nil)
      @content = content
    end

    def source
      <<-CLI_FILE.gsub(/^ {8}/, '')
        require 'valet'

        class CLI < Valet::Application
        #{@content ? @content.gsub(/^/, '  ') : '# No content has been given'}
        end

        CLI.start
      CLI_FILE
    end
  end

  def new_cli(content = nil)
    CLI.new(content)
  end
end
