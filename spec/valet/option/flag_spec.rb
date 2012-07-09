require 'spec_helper'

describe Valet::Option::Flag do
  let(:opt) { Option::Flag.new(:output) }

  describe "#switch?" do
    it "should be false" do
      opt.switch?.should be_false
    end
  end

  describe "#flag?" do
    it "should be true" do
      opt.flag?.should be_true
    end
  end
end
