require 'spec_helper'

describe Valet::Option::Common do
  let(:opt) { Option::Common.new(:format) }

  describe ".create" do
    it "creates a new option" do
      Option::Flag.create(:format).should be_an_instance_of(Option::Flag)
    end

    it "assigns parameters if given" do
      opt = Option::Flag.create(:format, short: :f)
      opt.short_name.should == :f
    end
  end

  describe "#initialize" do
    subject { opt }

    its(:name)        { should be_a(Symbol) }
    its(:short_name)  { should be_nil }
    its(:description) { should be_nil }
    its(:default)     { should be_nil }
    its(:value)       { should be_nil }
  end

  describe "attributes" do
    it "can be given a short name" do
      opt.short_name = :f
      opt.short_name.should == :f
    end

    it "can be given a description" do
      opt.description = 'specify a format (HTML, Markdown or Textile)'
      opt.description.should == 'specify a format (HTML, Markdown or Textile)'
    end

    it "can be given a default value" do
      opt.value = :html
      opt.value.should == :html
    end
  end
end
