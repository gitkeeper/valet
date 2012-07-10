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

  describe "#to_s" do
    context "if the switch's default is false" do
      let(:opt) { Option::Switch.new(:force) }

      it "returns the switch's long name as '--switch'" do
        expect(opt.to_s).to eq('--force')
      end

      it "prepends the switch's short name as '-s, --switch'" do
        opt.short_name = :f
        expect(opt.to_s).to start_with('-f, ')
      end
    end

    context "if the switch's default is true" do
      let(:opt) { Option::Switch.new(:clobber, default: true) }

      it "returns the switch's long name as --no-switch" do
        expect(opt.to_s).to eq('--no-clobber')
      end

      it "prepends the switch's short name as '-s, --no-switch'" do
        opt.short_name = :c
        expect(opt.to_s).to start_with('-c, ')
      end
    end

    it "transforms underscores in the long name to dashes and spaces" do
      opt = Option::Switch.new(:ignore_errors)
      expect(opt.to_s).to eq('--ignore-errors')
    end
  end

  describe "#switch?" do
    specify { expect(opt.switch?).to be_true }
  end

  describe "#flag?" do
    specify { expect(opt.flag?).to be_false }
  end
end
