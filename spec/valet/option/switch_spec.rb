require 'spec_helper'

describe Valet::Option::Switch do
  it_behaves_like "a common option"

  subject(:opt) { Option::Switch.new(:verbose) }

  its(:default) { should be_false }
  its(:value) { should be_false }

  describe "attributes" do
    it "can be given a new default 'true'" do
      opt.default = true
      expect(opt.value).to be_true
    end

    it "can be given a new default 'false'" do
      opt.default = false
      expect(opt.value).to be_false
    end
  end

  describe "#switch" do
    it "changes the value from false to true" do
      opt.default = false
      expect(opt.switch).to be_true
    end

    it "changes the value from true to false" do
      opt.default = true
      expect(opt.switch).to be_false
    end
  end

  describe "#long_name_to_s" do
    it "returns '--switch' if the switch defaults to false" do
      opt.default = false
      expect(opt.long_name_to_s).to eq('--verbose')
    end

    it "returns '--no-switch' if the switch defaults to true" do
      opt.default = true
      expect(opt.long_name_to_s).to eq('--no-verbose')
    end

    it "transforms underscores to dashes" do
      opt = Option::Switch.new(:ignore_errors)
      expect(opt.long_name_to_s).to eq('--ignore-errors')
    end
  end

  describe "#switch?" do
    specify { expect(opt.switch?).to be_true }
  end

  describe "#flag?" do
    specify { expect(opt.flag?).to be_false }
  end
end
