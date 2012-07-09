require 'spec_helper'

describe Valet::Options do
  let(:opts) { Options.new }

  describe "dynamic methods" do
    context "access to flag options (#method_name == options.name)" do
      before do
        opt = stub("Flag", name: :output, value: '~/backups', flag?: true,
          switch?: false)
        opts << opt
      end

      it "returns the flag's value if #method_name matches its option name" do
        opts.output.should == '~/backups'
      end

      it "raises a NoMethodError is using a question mark in #method_name" do
        expect { opts.output? }.to raise_error(NoMethodError)
      end

      it "raises a NoMethodError if there's no flag matching #method_name" do
        expect { opts.port }.to raise_error(NoMethodError)
      end
    end

    context "access to switch options (#method_name(?) == options.name)" do
      before do
        opt = stub("Switch", name: :verbose, value: false, switch?: true,
          flag?: false)
        opts << opt
      end

      it "returns the switch's value if #method_name(?) matches its option name" do
        opts.verbose?.should == false
      end

      it "raises a NoMethodError if using no question mark in #method_name" do
        expect { opts.verbose }.to raise_error(NoMethodError)
      end

      it "raises a NoMethodError if there's no switch matching #method_name" do
        expect { opts.explain? }.to raise_error(NoMethodError)
      end
    end
  end
end
