require 'spec_helper'

describe Valet::Application do
  let(:app) { Class.new.extend(Valet::Application) }

  it "has a name" do
    app.name = 'Backup'
    app.name.should == 'Backup'
  end

  it "can a version" do
    app.version = '1.2.3'
    app.version.should == '1.2.3'
  end

  it "can have a copyright notice" do
    app.copyright = 'Copyright (c) 2007 Free Software Foundation, Inc.'
    app.copyright.should == 'Copyright (c) 2007 Free Software Foundation, Inc.'
  end

  it "can have a license" do
    app.license = <<-LICENSE.gsub(/^ {6}/, '')
      License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
      This is free software: You are free to change and redistribute it.
      There is NO WARRANTY, to the extent permitted by law.
    LICENSE
    app.license.should include('GNU GPL version 3 or later')
  end
end
