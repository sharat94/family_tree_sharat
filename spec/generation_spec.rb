
require 'generation'

describe Generation do
  describe ".initialize" do
    it "returns an object" do
      expect(Generation.new(1).generation_stage).to eql(1)
    end
  end
end