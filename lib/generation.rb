class Generation #currently redundant but kept seperate to maintain real world similarities
  attr_accessor :generation_stage, :people
  def initialize(generation_stage)
    @generation_stage = generation_stage
    @people = []
  end
end