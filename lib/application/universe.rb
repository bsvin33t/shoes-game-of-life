class Universe

  def initialize(dimensions)
    @dimensions = dimensions
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