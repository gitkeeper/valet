require 'spec_helper'

describe Valet::Application do
  let(:app) { Application.new }

  describe "class attributes" do
    it "can have a name" do
      Application.name = 'Backup'
      Application.name.should == 'Backup'
    end

    it "can have a version" do
      Application.version = '1.2.3'
      Application.version.should == '1.2.3'
    end

    it "can have authors" do
      Application.authors = ['Alexander Baumann', 'Bob the Builder']
      Application.authors.should == ['Alexander Baumann', 'Bob the Builder']
    end

    it "can have a copyright notice" do
      Application.copyright = 'Copyright (c) 2012 Free Software Foundation, Inc.'
      Application.copyright.should == 'Copyright (c) 2012 Free Software Foundation, Inc.'
    end

    it "can have a license" do
      Application.license = <<-LICENSE.gsub(/^ {6}/, '').strip
        License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
        This is free software: You are free to change and redistribute it.
        There is NO WARRANTY, to the extent permitted by law.
      LICENSE
      Application.license.should include('GNU GPL version 3 or later')
    end
  end

  describe ".start" do
    it "passes ARGV as arguments to it's new instance by default" do
      app = Application.start
      app.args.should == ARGV
    end

    it "can pass custom arguments to it's new instance" do
      app = Application.start(%w( --custom arguments ))
      app.args.should == %w( --custom arguments )
    end

    it "returns the new application" do
      Application.start.should be_an_instance_of(Application)
    end
  end
end
