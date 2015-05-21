class Universe

  attr_reader :cells


  def initialize(dimensions, living_cells_locations=[])
    @dimensions = dimensions
    add_cells(living_cells_locations)
  end

  def living_cells
    @cells.values.select { |cell| cell.status == Cell::ALIVE }
  end

  def valid?
    @dimensions.all? { |value| value >= 0 }
  end

  def cell_at(*coordinates)
    unless out_of_bounds?(coordinates) && !@cells[coordinates].nil?
      @cells[coordinates]
    end
  end

  def tick
    cells_location = @cells.values.collect do |cell|
      new_cell = cell.tick
      new_cell.location if new_cell.status == Cell::ALIVE
    end
    add_cells(cells_location.compact)
  end


  private

  def out_of_bounds?(coordinates)
    @dimensions.zip(coordinates).any? do |dimension, coordinate|
      dimension <= coordinate || coordinate < 0
    end
  end

  def add_cells(living_cells_locations)
    @cells = Hash.new
    living_cells_locations.each { |location|
      add_or_increment_neighbouring_cells(location)
      if !out_of_bounds?(location) && @cells[location].nil?
        @cells[location] = Cell.alive(location)
      elsif !out_of_bounds?(location) && !@cells[location].nil?
        @cells[location].resurrect
      end
    }
  end

  def add_or_increment_neighbouring_cells(location)
    neighbouring_positions(location).each do |position|
      @cells[position] = Cell.dead(position) if @cells[position].nil? && !out_of_bounds?(position)
      @cells[position].increment_neighbour unless @cells[position].nil?
    end
  end

  def neighbouring_positions(location)
    x = location[0]
    y = location[1]
    [[x-1, y-1], [x, y-1], [x+1, y-1],
     [x-1, y], [x+1, y],
     [x-1, y+1], [x, y+1], [x+1, y+1]]
  end
end