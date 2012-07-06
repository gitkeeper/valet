require 'spec_helper'

describe Valet::VERSION do
  it "has a major version number" do
    Valet::VERSION::MAJOR.should be_an(Integer)
  end

  it "has a minor version number" do
    Valet::VERSION::MINOR.should be_an(Integer)
  end

  it "has a build version number" do
    Valet::VERSION::BUILD.should be_an(Integer)
  end

  it "has a RubyGems compliant version string" do
    Valet::VERSION::STRING.should match(/\A\d+\.\d+\.\d+(\.rc\d+)?\z/)
  end
end
