require 'spec_helper'

describe Valet::Option::Switch do
  it_behaves_like "a common option"

  subject(:opt) { Option::Switch.new(:verbose) }

  its(:default) { should be_false }
  its(:value)   { should be_false }

  describe "#initialize" do
    it "can be set to true by default" do
      opt = Option::Switch.new(:verbose, default: true)
      expect(opt.value).to be_true
    end
  end

  describe "#switch" do
    it "changes the value from false to true" do
      opt = Option::Switch.new(:verbose)
      expect(opt.switch).to be_true
    end

    it "changes the value from true to false" do
      opt = Option::Switch.new(:verbose, default: true)
      expect(opt.switch).to be_false
    end
  end

  describe "#long_name_to_s" do
    it "returns the switch's long name as '--switch'" do
      opt = Option::Switch.new(:force)
      expect(opt.long_name_to_s).to eq('--force')
    end

    it "returns the switch's long name as --no-switch" do
      opt = Option::Switch.new(:clobber, default: true)
      expect(opt.long_name_to_s).to eq('--no-clobber')
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
