require 'spec_helper'

describe Valet::Application do
  subject(:app) { Application.new }

  describe "class attributes" do
    it "can have a name" do
      Application.name = 'Backup'
      expect(Application.name).to eq('Backup')
    end

    it "can have a version" do
      Application.version = '1.2.3'
      expect(Application.version).to eq('1.2.3')
    end

    it "can have authors" do
      Application.authors = ['Alexander Baumann', 'Bob the Builder']
      expect(Application).to have(2).authors
    end

    it "can have a copyright notice" do
      Application.copyright = 'Copyright (c) 2012 Free Software Foundation, Inc.'
      expect(Application.copyright).to eq('Copyright (c) 2012 Free Software Foundation, Inc.')
    end

    it "can have a license" do
      Application.license = <<-LICENSE.gsub(/^ {8}/, '').strip
        License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
        This is free software: You are free to change and redistribute it.
        There is NO WARRANTY, to the extent permitted by law.
        LICENSE
      expect(Application.license).to include('GNU GPL version 3 or later')
    end
  end

  describe ".commands" do
    it "exposes the commands collection" do
      expect(Application.commands).to be_an_instance_of(Commands)
    end
  end

  describe ".command" do
    let(:command) { double("Command") }

    it "adds a new command to the application's command collection" do
      Command.stub(new: command)

      Application.commands.should_receive(:<<).with(command)
      Application.command(:backup)
    end

    it "returns the application's command collection" do
      expect(Application.command(:backup)).to be(Application.commands)
    end
  end

  describe ".start" do
    it "passes ARGV as arguments to it's new instance by default" do
      app = Application.start
      expect(app.arguments).to be(ARGV)
    end

    it "can pass custom arguments to it's new instance" do
      app = Application.start(%w( --custom arguments ))
      expect(app.arguments).to eq(%w( --custom arguments ))
    end

    it "returns the new application" do
      expect(Application.start).to be_an_instance_of(Application)
    end
  end

  its(:arguments) { should be(ARGV) }
end
