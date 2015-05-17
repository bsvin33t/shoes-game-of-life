class Universe

  def initialize(dimensions)
    @dimensions = dimensions
  end

  def valid?
    @dimensions.all? {|value| value >= 0}
  end
end