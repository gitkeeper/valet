require 'spec_helper'

describe Valet::Command do
  let(:cmd) { Command.new(:backup) { 'Backing up...' } }

  describe "#initialize" do
    subject { cmd }

    its(:name)        { should be_a(Symbol) }
    its(:action)      { should be_a(Proc) }
    its(:options)     { should be_an_instance_of(Options) }
    its(:commands)    { should be_an_instance_of(Commands) }
    its(:summary)     { should be_nil }
    its(:description) { should be_nil }
  end

  describe "attributes" do
    it "can be given an action by supplying a Proc" do
      cmd.action { 'Backing up...' }
      cmd.action.call.should == 'Backing up...'
    end

    it "can be given options" do
      cmd.stub(options: double("Options"))

      cmd.options.should_receive(:<<)
      cmd.options << stub("Option")
    end

    it "can be given (sub-)commands" do
      cmd.stub(commands: double("Commands"))

      cmd.commands.should_receive(:<<)
      cmd.commands << stub("Command")
    end

    it "can be given a summary" do
      cmd.summary = 'Backup compresses and archives your precious data.'
      cmd.summary.should == 'Backup compresses and archives your precious data.'
    end

    it "can be given a description" do
      description = <<-DESC.gsub(/ {8}/, '')
        Backup tends to your precious data by scheduling cron jobs that
        compress and archive your files efficiently. You can specify one or
        multiple locations to copy your archives to.
      DESC
      cmd.description = description
      cmd.description.should == description
    end
  end

  describe "#option" do
    context "if the option has no specific type" do
      it "adds a new switch option to the command's option collection" do
        option = stub("Option")
        Option::Switch.stub(create: option)

        cmd.options.should_receive(:<<).with(option)
        cmd.option(:verbose)
      end

      it "returns the command's option collection" do
        cmd.option(:verbose).should == cmd.options
      end
    end

    context "if the option has a specific type" do
      it "adds a new flag option to the command's option collection" do
        option = stub("Option", type: String)
        Option::Flag.stub(create: option)

        cmd.options.should_receive(:<<).with(option)
        cmd.option(:output, type: String)
      end

      it "returns the command's option collection" do
        cmd.option(:output, type: String).should == cmd.options
      end
    end
  end

  describe "#execute" do
    it "can call an action without block parameters" do
      cmd.action { 'Backing up...' }
      cmd.execute.should == 'Backing up...'
    end

    it "has access to #options" do
      cmd.stub(options: double("Options", verbose?: true))
      cmd.action { |options| 'Backing up...' if options.verbose? }

      cmd.options.should_receive(:verbose?)
      cmd.execute
    end

    it "can call an action with one operand" do
      cmd.action { |_, name| "Hello #{name}!"}
      cmd.execute('Bob').should == 'Hello Bob!'
    end

    it "can call an action with multiple operands" do
      cmd.action { |_, first_name, last_name| "#{first_name} #{last_name}" }
      cmd.execute('Robert', 'Martin') == 'Robert Martin'
    end

    it "can call an action with multiple operands and have access to #options" do
      cmd.stub(options: double("Options", last_name?: false))
      cmd.action do |options, first_name, last_name|
        options.last_name? ? last_name : first_name
      end

      cmd.execute('Robert', 'Martin') == 'Robert'
    end

    it "exits with 0 if everything went well"
    it "exits with 1 if there was a problem"
  end

  describe "#usage" do
    it "returns the command's basic syntax"
    it "returns the command's syntax for available options"
    it "returns the command's syntax for available (sub-)commands"
    it "returns an [OPTION] placeholder if there are many options"
    it "returns a [COMMAND] placeholder if there are many (sub-)commands"
  end

  describe "#help" do
    it "returns the command's usage"
    it "returns the command's summary"
    it "returns the command's description"
    it "returns the command's examples"
    it "returns the command's available options"
    it "returns the command's available (sub-)commands"
  end
end
