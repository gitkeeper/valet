require 'spec_helper'

describe Valet::VERSION do
  it "has a major version number" do
    expect(Valet::VERSION::MAJOR).to be_an(Integer)
  end

  it "has a minor version number" do
    expect(Valet::VERSION::MINOR).to be_an(Integer)
  end

  it "has a build version number" do
    expect(Valet::VERSION::BUILD).to be_an(Integer)
  end

  it "has a RubyGems compliant version string" do
    expect(Valet::VERSION::STRING).to match(/\A\d+\.\d+\.\d+(\.rc\d+)?\z/)
  end
end
