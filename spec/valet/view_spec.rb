require 'spec_helper'

describe Valet::View do
  let(:view) { View.new }
  let(:mustache) { double("Mustache") }

  describe "#render" do
    it "creates a new Mustache object and renders it" do
      Mustache.stub(new: mustache)
      mustache.stub(render: 'Render output!')
      view.render.should == 'Render output!'
    end
  end

  describe "#escapeHTML" do
    it "overwrites Mustache's #escapeHTML to not escape at all" do
      view.escapeHTML('<html>').should == '<html>'
    end
  end
end
