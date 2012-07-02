require 'spec_helper'

describe Valet::VERSION do
  it "has a RubyGems compliant version string" do
    Valet::VERSION::STRING.should match(/^\d+\.\d+\.\d+(\.rc\d+)?$/)
  end
end
