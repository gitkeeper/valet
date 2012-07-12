require 'spec_helper'

describe Valet::Option::Flag do
  it_behaves_like "a common option"

  subject(:opt) { Option::Flag.new(:output) }

  its(:type)     { should be_nil }
  its(:default)  { should be_nil }
  its(:value)    { should be_nil }
  its(:arg_name) { should eq('output')}

  describe "attributes" do
    it "can be given a type" do
      opt.type = Integer
      expect(opt.type).to be(Integer)
    end

    it "can be given a default" do
      opt.default = '~/backups'
      expect(opt.value).to eq('~/backups')
    end

    it "can be given a value" do
      opt.value = '/var/backups'
      expect(opt.value).to eq('/var/backups')
    end

    it "converts the given value to the given type" do
      opt.type = Array
      opt.value = 'Bob,Alisha,Fred'
      expect(opt.value).to eq(%w( Bob Alisha Fred ))
    end

    it "can be given a custom argument name" do
      opt.arg_name = 'file'
      expect(opt.arg_name).to eq('file')
    end
  end

  describe "#long_name_to_s" do
    it "returns '--flag=<flag>' if the flag has no default" do
      opt = Option::Flag.new(:suffix)
      opt.default = nil
      expect(opt.long_name_to_s).to eq('--suffix=<suffix>')
    end

    it "returns '--flag[=<flag>]' if the flag has a default" do
      opt = Option::Flag.new(:chmod)
      opt.default = 755
      expect(opt.long_name_to_s).to eq('--chmod[=<chmod>]')
    end

    it "transforms underscores to dashes" do
      opt = Option::Flag.new(:target_directory)
      expect(opt.long_name_to_s).to eq('--target-directory=<target directory>')
    end

    it "prints the custom argument name if it has been set" do
      opt = Option::Flag.new(:remote_host)
      opt.arg_name = 'host'
      expect(opt.long_name_to_s).to eq('--remote-host=<host>')
    end
  end

  describe "#switch?" do
    specify { expect(opt.switch?).to be_false }
  end

  describe "#flag?" do
    specify { expect(opt.flag?).to be_true }
  end
end
