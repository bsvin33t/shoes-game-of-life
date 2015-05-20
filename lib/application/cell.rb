class Cell

  attr_reader :location, :neighbour_count

  def initialize(*location)
    @location = location
    @neighbour_count = 0
  end

  def ==(other_cell)
    (object_id == other_cell.object_id) || (hash == other_cell.hash) || (self.class == other_cell.class && location == other_cell.location)
  end

  alias :eql? :==

  def alive_for_next_tick?
    if neighbour_count == 2 || neighbour_count == 3
      true
    else
      false
    end
  end

  def increment_neighbour
    @neighbour_count +=1
  end
end