require 'spec_helper'

describe Valet::Command do
  subject(:cmd) { Command.new(:backup) }

  describe "#initialize" do
    subject(:cmd) { Command.new(:backup) { 'Backing up...' } }

    its(:name)        { should be_a(Symbol) }
    its(:action)      { should be_a(Proc) }
    its(:options)     { should be_an_instance_of(Options) }
    its(:syntax)      { should be_nil }
    its(:summary)     { should be_nil }
    its(:description) { should be_nil }
    its(:examples)    { should eq([])}
  end

  describe "attributes" do
    it "options can be added" do
      cmd.options << double("Option")
      expect(cmd.options).to have(1).option
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

    it "can be given one ore more examples" do
      cmd.examples << ['zipped backup', 'backup --gzip ~/project ~/backups']
      expect(cmd.examples).to have(1).example
    end
  end

  describe "#action" do
    before { cmd.action { 'Backing up...' } }

    it "attaches a new action if a block is supplied" do
      cmd.action { 'Deleting all backups...' }
      expect(cmd.action.call).to eq('Deleting all backups...')
    end

    it "returns the action if no block is supplied" do
      expect(cmd.action.call).to eq('Backing up...')
    end
  end

  describe "#option" do
    context "if the option has no specific type" do
      let(:option) { double("Option") }

      it "adds a new switch option to the command's option collection" do
        Option::Switch.stub(new: option)

        cmd.options.should_receive(:<<).with(option)
        cmd.option(:verbose)
      end

      it "returns the command's option collection" do
        expect(cmd.option(:verbose)).to be(cmd.options)
      end
    end

    context "if the option has a specific type" do
      let(:option) { double("Option", type: String) }

      it "adds a new flag option to the command's option collection" do
        Option::Flag.stub(new: option)

        cmd.options.should_receive(:<<).with(option)
        cmd.option(:output, type: String)
      end

      it "returns the command's option collection" do
        expect(cmd.option(:output, type: String)).to be(cmd.options)
      end
    end
  end

  describe "#execute" do
    it "can call an action without block parameters" do
      cmd.action { 'Backing up...' }
      expect(cmd.execute).to eq('Backing up...')
    end

    it "has access to #options" do
      cmd.stub(options: double("Options", verbose?: true))
      cmd.action { |options| 'Backing up...' if options.verbose? }

      cmd.options.should_receive(:verbose?)
      cmd.execute
    end

    it "can call an action with one operand" do
      cmd.action { |_, name| "Hello #{name}!"}
      expect(cmd.execute('Bob')).to eq('Hello Bob!')
    end

    it "can call an action with multiple operands" do
      cmd.action { |_, first_name, last_name| "#{first_name} #{last_name}" }
      expect(cmd.execute('Robert', 'Martin')).to eq('Robert Martin')
    end

    it "can call an action with multiple operands and have access to #options" do
      cmd.stub(options: double("Options", last_name?: false))
      cmd.action do |options, first_name, last_name|
        options.last_name? ? last_name : first_name
      end

      expect(cmd.execute('Robert', 'Martin')).to eq('Robert')
    end
  end
end
