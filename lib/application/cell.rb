class Cell

  attr_reader :location

  def initialize(*location)
    @location = location
  end

  def ==(other_cell)
    (object_id == other_cell.object_id) || (hash == other_cell.hash) || (self.class == other_cell.class && location == other_cell.location)
  end
  alias :eql? :==

end