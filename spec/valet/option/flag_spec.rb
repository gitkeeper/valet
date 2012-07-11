require 'spec_helper'

describe Valet::Option::Flag do
  it_behaves_like "a common option"

  subject(:opt) { Option::Flag.new(:output) }

  its(:type)     { should be(String) }
  its(:default)  { should be_nil }
  its(:value)    { should be_nil }
  its(:arg_name) { should eq('output')}

  describe "attributes" do
    it "can be given a custom type" do
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

    it "can be given a custom argument name" do
      opt.arg_name = 'file'
      expect(opt.arg_name).to eq('file')
    end

    context "raises an OptionError" do
      it "if the given type is not allowed" do
        expect { opt.type = Mutex }.to raise_error(TypeError)
      end
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
