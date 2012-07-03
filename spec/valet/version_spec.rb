require 'spec_helper'

describe VERSION do
  it "has a major version number" do
    VERSION::MAJOR.should be_an(Integer)
  end

  it "has a minor version number" do
    VERSION::MINOR.should be_an(Integer)
  end

  it "has a build version number" do
    VERSION::BUILD.should be_an(Integer)
  end

  it "has a RubyGems compliant version string" do
    VERSION::STRING.should match(/^\d+\.\d+\.\d+(\.rc\d+)?$/)
  end
end
