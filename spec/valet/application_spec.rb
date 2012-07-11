require 'spec_helper'

describe Valet::Application do
  subject(:app) { Application.new }

  its(:arguments)   { should be(ARGV) }
  its(:options)     { should be_an_instance_of(Options) }
  its(:commands)    { should be_an_instance_of(Commands) }

  its(:name)        { should be_nil }
  its(:version)     { should be_nil }
  its(:authors)     { should be_nil }
  its(:email)       { should be_nil }
  its(:homepage)    { should be_nil }
  its(:copyright)   { should be_nil }
  its(:license)     { should be_nil }
  its(:summary)     { should be_nil }
  its(:description) { should be_nil }
  its(:examples)    { should eq([]) }

  describe "attributes" do
    it "can be given a name" do
      app.name = 'Backup'
      expect(app.name).to eq('Backup')
    end

    it "can be given a version" do
      app.version = '1.2.3'
      expect(app.version).to eq('1.2.3')
    end

    it "can be given authors" do
      app.authors = ['Alexander Baumann', 'Bob the Builder']
      expect(app).to have(2).authors
    end

    it "can be given email addresses" do
      app.email = ['alexander.baumann@arclight.ch', 'bob@builder.com']
      expect(app.email).to have(2).emails
    end

    it "can be given a homepage" do
      app.homepage = 'http://gitkeeper.github.com/valet'
      expect(app.homepage).to eq('http://gitkeeper.github.com/valet')
    end

    it "can be given a copyright notice" do
      app.copyright = 'Copyright (c) 2012 Free Software Foundation, Inc.'
      expect(app.copyright).to eq('Copyright (c) 2012 Free Software Foundation, Inc.')
    end

    it "can be given a license" do
      app.license = <<-LICENSE.gsub(/^ {8}/, '').strip
        License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
        This is free software: You are free to change and redistribute it.
        There is NO WARRANTY, to the extent permitted by law.
      LICENSE
      expect(app.license).to include('GNU GPL version 3 or later')
    end

    it "can be given a summary" do
      app.summary = 'A framework for creating GNU compliant CLIs.'
      expect(app.summary).to eq('A framework for creating GNU compliant CLIs.')
    end

    it "can be given a description" do
      app.description = <<-DESC.gsub(/^ {8}/, '').strip
        Valet helps you write the sophisticated command-line interfaces you're
        so used to from GNU/Linux. It provides a beautiful API, rich template
        support, smart configuration, man page generator, and many other useful
        features. No matter how large or complex your application is, Valet tops
        it off with the command-line interface it deserves.
      DESC
      expect(app.description).to include('provides a beautiful API')
    end

    it "can be given examples" do
      app.examples << ['Generate command files' 'valet generate command backup']
      expect(app.examples).to have(1).example
    end
  end
end
