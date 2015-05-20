class Universe


  def initialize(dimensions, living_cells=[])
    @dimensions = dimensions
    add_living_cells(living_cells)
  end

  def living_cells
    @living_cells.values
  end

  def valid?
    @dimensions.all? { |value| value >= 0 }
  end

  def cell_at(*coordinates)
    unless out_of_bounds?(coordinates) && !@living_cells[coordinates].nil?
      @living_cells[coordinates]
    end
  end


  private

  def out_of_bounds?(coordinates)
    @dimensions.zip(coordinates).any? do |dimension, coordinate|
      dimension < coordinate
    end
  end

  def add_living_cells(living_cells)
    @living_cells = Hash.new
    living_cells.each { |living_cell|
      @living_cells[living_cell.location] = living_cell unless out_of_bounds?(living_cell.location)
    }
  end
end