require 'spec_helper'

describe Valet::Options do
  subject(:opts) { Options.new }

  describe "dynamic methods" do
    before do
      opts << Option::Switch.new(:verbose, default: false)
      opts << Option::Flag.new(:output, default: '~/backups')
    end

    context "access to switch options" do
      it "returns the switch's value if #method_name matches its option name" do
        expect(opts.verbose?).to be_false
      end

      it "raises a NoMethodError if using no question mark in #method_name" do
        expect { opts.verbose }.to raise_error(NoMethodError)
      end

      it "raises a NoMethodError if there's no switch matching #method_name" do
        expect { opts.cache? }.to raise_error(NoMethodError)
      end
    end

    context "access to flag options" do
      it "returns the flag's value if #method_name matches its option name" do
        expect(opts.output).to eq('~/backups')
      end

      it "raises a NoMethodError is using a question mark in #method_name" do
        expect { opts.output? }.to raise_error(NoMethodError)
      end

      it "raises a NoMethodError if there's no flag matching #method_name" do
        expect { opts.dirs }.to raise_error(NoMethodError)
      end
    end
  end
end
