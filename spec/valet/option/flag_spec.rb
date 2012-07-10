require 'spec_helper'

describe Valet::Option::Flag do
  it_behaves_like "a common option"

  subject(:opt) { Option::Flag.new(:output) }

  its(:default) { should be_nil }
  its(:value)   { should be_nil }
  its(:type)    { should be(String) }

  describe "#initialize" do
    it "can be set to a custom value by default" do
      opt = Option::Flag.new(:output, default: '~/backups')
      expect(opt.value).to eq('~/backups')
    end

    it "can be set to a custom type" do
      opt = Option::Flag.new(:output, type: Array)
      expect(opt.type).to be(Array)
    end
  end

  describe "attributes" do
    it "can be assigned a new value" do
      opt.value = '/var/backups'
      expect(opt.value).to eq('/var/backups')
    end
  end

  describe "#to_s" do
    context "if the flag has no default" do
      let(:opt) { Option::Flag.new(:suffix) }

      it "returns the flag's long name as '--flag=FLAG'" do
        expect(opt.to_s).to eq('--suffix=SUFFIX')
      end

      it "prepends the flag's short name as '-f, --flag=FLAG'" do
        opt.short_name = :s
        expect(opt.to_s).to start_with('-s, ')
      end
    end

    context "if the flag has a default" do
      let(:opt) { Option::Flag.new(:chmod, default: 775) }

      it "returns the flag's long name as --flag[=FLAG]" do
        expect(opt.to_s).to eq('--chmod[=CHMOD]')
      end

      it "prepends the flag's short name as '-f, --flag[=FLAG] '" do
        opt.short_name = :c
        expect(opt.to_s).to start_with('-c, ')
      end
    end

    it "transforms underscores in the long name to dashes and spaces" do
      opt = Option::Flag.new(:target_directory)
      expect(opt.to_s).to eq('--target-directory=TARGET DIRECTORY')
    end
  end

  describe "#switch?" do
    specify { expect(opt.switch?).to be_false }
  end

  describe "#flag?" do
    specify { expect(opt.flag?).to be_true }
  end
end
