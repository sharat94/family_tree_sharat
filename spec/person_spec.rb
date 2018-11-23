
require 'person'

describe Person do
  describe ".initialize" do
    it "check if generation stage is correct" do
      expect(Generation.new(1).generation_stage).to eql(1)
    end
  end
end