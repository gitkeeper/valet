require 'spec_helper'

describe Valet::Command do
  subject(:cmd) { Command.new(:backup) }

  its(:name)        { should be_a(Symbol) }
  its(:aliases)     { should eq([]) }
  its(:action)      { should be_nil }
  its(:options)     { should be_an_instance_of(Options) }
  its(:commands)    { should be_an_instance_of(Commands) }
  its(:syntax)      { should be_nil }
  its(:summary)     { should be_nil }
  its(:description) { should be_nil }
  its(:examples)    { should eq([]) }

  describe "#initialize" do
    context "raises a CommandError" do
      it "if the name is not a symbol" do
        expect { Command.new('backup') }.to raise_error(CommandError)
      end
    end
  end

  describe "attributes" do
    it "can be given aliases" do
      cmd.aliases << :bak
      expect(cmd.aliases).to include(:bak)
    end

    it "can be given options" do
      cmd.options << double("Option")
      expect(cmd.options).to have(1).option
    end

    it "can be given (sub-)commands" do
      cmd.commands << double("Command")
      expect(cmd.commands).to have(1).command
    end

    it "can be given a syntax" do
      cmd.syntax = 'backup [OPTION]... SOURCE... DIRECTORY'
      expect(cmd.syntax).to eq('backup [OPTION]... SOURCE... DIRECTORY')
    end

    it "can be given a summary" do
      cmd.summary = 'Backup compresses and archives your precious data.'
      expect(cmd.summary).to eq('Backup compresses and archives your precious data.')
    end

    it "can be given a description" do
      description = <<-DESC.gsub(/ {8}/, '')
        Backup tends to your precious data by scheduling cron jobs that
        compress and archive your files efficiently. You can specify one or
        multiple locations to copy your archives to.
      DESC
      cmd.description = description
      expect(cmd.description).to be(description)
    end

    it "can be given examples" do
      cmd.examples << ['A zipped backup', 'backup --gzip ~/projects ~/backups ']
      expect(cmd.examples).to have(1).example
    end
  end

  describe "#action" do
    before { cmd.action { 'Backing up...' } }

    it "attaches a new action if a block is supplied" do
      cmd.action { 'Deleting all backups...' }
      expect(cmd.action.call).to eq('Deleting all backups...')
    end

    it "attaches actions with one block parameter (options)" do
      expect { cmd.action { |opts| "#{opts}" } }.not_to raise_error
    end

    it "attaches actions with two block parameters (operands, options)" do
      expect { cmd.action { |args, opts| "#{args} #{opts}" } }.not_to raise_error
    end

    it "raises a CommandError if more than two block parameters are given" do
      expect { cmd.action { |a, b, c| a + b + c } }.to raise_error(CommandError)
    end

    it "raises a CommandError if arbitrary number of parameters are given" do
      expect { cmd.action { |*args, opts| "#{args} #{opts}" } }.to raise_error(CommandError)
    end

    it "returns the action if no block is supplied" do
      expect(cmd.action.call).to eq('Backing up...')
    end
  end

  describe "#execute" do
    it "can call an action without block parameters" do
      cmd.stub(action: -> { 'Backing up...' })
      expect(cmd.execute).to eq('Backing up...')
    end

    it "can call an action with one block parameter (options)" do
      cmd.stub(options: double("Options", verbose?: true))
      cmd.stub(action: ->(opts) { 'Backing up...' if opts.verbose? })

      cmd.options.should_receive(:verbose?)
      cmd.execute
    end

    it "can call an action with two block parameters (operands, options)" do
      cmd.stub(options: double("Options", verbose?: true))
      cmd.stub(action: ->(args, opts) { args.shift if opts.verbose? })

      expect(cmd.execute('Backing up...')).to eq('Backing up...')
    end
  end
end
