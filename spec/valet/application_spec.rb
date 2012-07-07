require 'spec_helper'

describe Valet::Application do
  let(:app) { Class.new.extend(Valet::Application) }

  it "has a name" do
    app.name = 'Backup'
    app.name.should == 'Backup'
  end

  it "can have a version" do
    app.version = '1.2.3'
    app.version.should == '1.2.3'
  end
end
