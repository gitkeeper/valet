require 'spec_helper'

describe Valet::View do
  let(:view) { View.new }

  describe "#escapeHTML" do
    it "overwrites Mustache's #escapeHTML to not escape at all" do
      view.escapeHTML('<html>').should == '<html>'
    end
  end
end
