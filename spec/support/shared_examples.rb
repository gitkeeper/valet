shared_examples_for "a common option" do
  subject(:opt) { described_class.new(:format) }

  its(:long_name) { should be_a(Symbol) }
  its(:short_name) { should be_nil }
  its(:summary) { should be_nil }
  its(:description) { should be_nil }

  describe "#initialize" do
    context "raises an OptionError" do
      it "if the long name is not a symbol" do
        expect { described_class.new('format') }.to raise_error(OptionError)
      end

      it "if the long name is only one character long" do
        expect { described_class.new(:f) }.to raise_error(OptionError)
      end
    end
  end

  describe "attributes" do
    it "can be given a short name" do
      opt.short_name = :f
      expect(opt.short_name).to be(:f)
    end

    it "can be given a summary" do
      opt.summary = 'Specify a format (Markdown or Textile)'
      expect(opt.summary).to eq('Specify a format (Markdown or Textile)')
    end

    it "can be given a description" do
      opt.description = 'A longer option description...'
      expect(opt.description).to eq('A longer option description...')
    end

    context "raises an OptionError" do
      it "if the short name is not a symbol" do
        expect { opt.short_name = 'f' }.to raise_error(OptionError)
      end

      it "if the short name is longer than one character" do
        expect { opt.short_name = 'format' }.to raise_error(OptionError)
      end
    end
  end

  describe "#short_name_to_s" do
    it "returns the short name's string representation" do
      opt.short_name = :f
      expect(opt.short_name_to_s).to eq('-f')
    end
  end
end
