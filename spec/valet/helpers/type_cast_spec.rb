require 'spec_helper'

describe Valet::Helpers::TypeCast do
  subject(:obj) { Class.new.extend(Helpers::TypeCast) }

  let(:array) { %w( Bob Alisha Fred ) }
  let(:array_comma) { 'Bob,Alisha,Fred' }
  let(:array_space) { 'Bob Alisha Fred' }

  let(:hash) { { name: 'Bob', gender: 'male', age: '42' } }
  let(:hash_comma) { 'name:Bob,gender:male,age:42' }
  let(:hash_space) { 'name:Bob gender:male age:42' }

  let(:time) { Time.parse('11.07.2012 08:00') }
  let(:time_string) { '11.07.2012 08:00'}

  describe "#string_to" do
    specify { expect(obj.string_to(String, 'Bob')).to eq('Bob') }
    specify { expect(obj.string_to(Integer, '13')).to eq(13) }
    specify { expect(obj.string_to(Float, '13.37')).to eq(13.37) }
    specify { expect(obj.string_to(Array, array_comma)).to eq(array) }
    specify { expect(obj.string_to(Array, array_space)).to eq(array) }
    specify { expect(obj.string_to(Hash, hash_comma)).to eq(hash) }
    specify { expect(obj.string_to(Hash, hash_space)).to eq(hash) }
    specify { expect(obj.string_to(Time, time_string)).to eq(time) }

    context "it raises a TypeError" do
      it "if the given type is not allowed" do
        expect { obj.string_to(Mutex, 'Bob') }.to raise_error(TypeError)
      end
    end
  end
end
