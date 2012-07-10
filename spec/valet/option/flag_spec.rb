require 'spec_helper'

describe Valet::Option::Flag do
  it_behaves_like "a common option"

  subject(:opt) { Option::Flag.new(:output) }

  its(:type)     { should be(String) }
  its(:argument) { should eq('OUTPUT') }
  its(:default)  { should be_nil }
  its(:value)    { should be_nil }

  describe "#initialize" do
    it "can be set to a custom type" do
      opt = Option::Flag.new(:output, type: Array)
      expect(opt.type).to be(Array)
    end

    it "can be set to a custom value by default" do
      opt = Option::Flag.new(:output, default: '~/backups')
      expect(opt.value).to eq('~/backups')
    end
  end

  describe "attributes" do
    it "can be assigned a different argument" do
      opt.argument = 'FILE'
      expect(opt.argument).to eq('FILE')
    end

    it "can be assigned a new value" do
      opt.value = '/var/backups'
      expect(opt.value).to eq('/var/backups')
    end
  end

  describe "#long_name_to_s" do
    it "returns '--flag=FLAG' if the flag has no default" do
      opt = Option::Flag.new(:suffix)
      expect(opt.long_name_to_s).to eq('--suffix=SUFFIX')
    end

    it "returns '--flag[=FLAG]' if the flag has a default" do
      opt = Option::Flag.new(:chmod, default: 775)
      expect(opt.long_name_to_s).to eq('--chmod[=CHMOD]')
    end

    it "transforms underscores to dashes" do
      opt = Option::Flag.new(:target_directory)
      expect(opt.long_name_to_s).to eq('--target-directory=TARGET DIRECTORY')
    end

    it "uses the custom option argument if given" do
      opt = Option::Flag.new(:remote_host, arg: 'HOST')
      expect(opt.long_name_to_s).to eq('--remote-host=HOST')
    end
  end

  describe "#switch?" do
    specify { expect(opt.switch?).to be_false }
  end

  describe "#flag?" do
    specify { expect(opt.flag?).to be_true }
  end
end
