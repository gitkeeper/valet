require 'spec_helper'

describe Valet::Option::Switch do
  let(:opt) { Option::Switch.new(:verbose) }

  describe "#switch?" do
    it "should be true" do
      opt.switch?.should be_true
    end
  end

  describe "#flag?" do
    it "should be false" do
      opt.flag?.should be_false
    end
  end
end
