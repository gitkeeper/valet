require 'spec_helper'

describe Valet::Options do
  subject(:opts) { Options.new }

  let(:switch) { Option::Switch.new(:verbose) }
  let(:flag) { Option::Flag.new(:output) }

  before { opts << switch << flag }

  describe "#[]" do
    it "searches for a switch option by a given name and returns it" do
      expect(opts[:verbose]).to equal(switch)
    end

    it "searches for a flag option by a given name and returns it" do
      expect(opts[:output]).to equal(flag)
    end

    it "returns nil if nothing could be found" do
      expect(opts[:clobber]).to be_nil
    end
  end

  describe "#method_missing" do
    context "access to switch options" do
      it "returns the switch's value if #method_name matches its option name" do
        switch.stub(value: true)
        expect(opts.verbose?).to be_true
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
        flag.stub(value: '~/backups')
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
