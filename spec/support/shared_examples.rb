shared_examples_for "a common option" do
  subject(:opt) { described_class.new(:format) }

  its(:long_name)   { should be_a(Symbol) }
  its(:short_name)  { should be_nil }
  its(:description) { should be_nil }

  describe "attributes" do
    it "can be given a short name" do
      opt.short_name = :f
      expect(opt.short_name).to be(:f)
    end

    it "can be given a description" do
      opt.description = 'specify a format (markdown or textile)'
      expect(opt.description).to eq('specify a format (markdown or textile)')
    end
  end

  describe "#short_name_to_s" do
    it "returns the short name's string representation" do
      opt.short_name = :f
      expect(opt.short_name_to_s).to eq('-f')
    end

    it "returns nil if no short name has been set" do
      expect(opt.short_name_to_s).to be_nil
    end
  end
end
