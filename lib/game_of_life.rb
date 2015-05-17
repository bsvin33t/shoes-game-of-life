class GameOfLife

  attr_reader :universe

  def initialize
    dimensions = []
    @universe = Universe.new(dimensions)
  end

end

