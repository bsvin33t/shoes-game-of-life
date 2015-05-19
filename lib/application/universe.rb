class Universe

  attr_reader :living_cells

  def initialize(dimensions, living_cells=[])
    @dimensions = dimensions
    @living_cells = living_cells
  end

  def valid?
    @dimensions.all? {|value| value >= 0}
  end

  def cell_at(*coordinates)
    unless out_of_bounds?(coordinates)
      Cell.new
    end
  end


  private

  def out_of_bounds?(coordinates)
    @dimensions.zip(coordinates).any? do |dimension, coordinate|
      dimension < coordinate
    end
  end
end