require 'spec_helper'

describe Valet::Helpers::StringConverter do
  subject(:converter) { Helpers::StringConverter.new }

  its(:target_type) { should be(String) }

  describe "attributes" do
    it "can be given a target type" do
      converter.target_type = Array
      expect(converter.target_type).to be(Array)
    end

    context "raises a TypeError" do
      it "if the given target type is not allowed" do
        expect { converter.target_type = Mutex }.to raise_error(TypeError)
      end
    end
  end

  describe "#convert" do
    it "converts a string to an integer" do
      converter.target_type = Integer
      expect(converter.convert('13')).to eq(13)
    end

    it "converts a string to a float" do
      converter.target_type = Float
      expect(converter.convert('13.37')).to eq(13.37)
    end

    context "arrays" do
      let(:array) { %w( Bob Alisha Fred ) }
      let(:array_comma) { 'Bob,Alisha,Fred' }
      let(:array_space) { 'Bob Alisha Fred' }

      it "converts a comma separated string to an array" do
        converter.target_type = Array
        expect(converter.convert(array_comma)).to eq(array)
      end

      it "converts a space separated string to an array" do
        converter.target_type = Array
        expect(converter.convert(array_space)).to eq(array)
      end
    end

    context "hashes" do
      let(:hash) { { name: 'Bob', gender: 'male', age: '42' } }
      let(:hash_comma) { 'name:Bob,gender:male,age:42' }
      let(:hash_space) { 'name:Bob gender:male age:42' }

      it "converts a comma separated string with colons to a hash" do
        converter.target_type = Hash
        expect(converter.convert(hash_comma)).to eq(hash)
      end

      it "converts a space separated string with colons to a hash"do
        converter.target_type = Hash
        expect(converter.convert(hash_space)).to eq(hash)
      end
    end

    context "time" do
      let(:time) { Time.parse('11.07.2012 08:00') }
      let(:time_string) { '11.07.2012 08:00'}

      it "converts a well formatted string to a time object" do
        converter.target_type = Time
        expect(converter.convert(time_string)).to eq(time)
      end
    end

    it "returns the same string if the target type is a string too" do
      converter.target_type = String; string = 'Bob'
      expect(converter.convert(string)).to equal(string)
    end
  end
end
