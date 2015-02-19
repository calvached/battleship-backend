class MockBoard
  attr_reader :dimensions

  def initialize(dimensions)
    @dimensions = dimensions.to_i
  end

  def create
  end
end
