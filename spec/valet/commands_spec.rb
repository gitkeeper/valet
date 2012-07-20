require 'spec_helper'

describe Valet::Commands do
  subject(:commands) { Commands.new }

  let(:backup) { double("Backup", name: :backup) }
  let(:upload) { double("Command", name: :upload) }

  before { commands << backup << upload }

  describe "#[]" do
    it "searches for a command by a given name and returns it" do
      expect(commands[:backup]).to equal(backup)
    end

    it "returns nil if nothing could be found" do
      expect(commands[:archive]).to be_nil
    end
  end
end
