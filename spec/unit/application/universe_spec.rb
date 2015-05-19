require 'rspec'

describe 'Universe' do

  it 'should be valid only if positive dimensions are passed' do
    dimensions = [10, 10]
    universe = Universe.new(dimensions)
    expect(universe).to be_valid
  end

  it 'should become invalid if negative dimensions are passed' do
    dimensions = [-1, -1]
    universe = Universe.new(dimensions)
    expect(universe).not_to be_valid
  end

  it 'should contain a living cell at a seeded location which is within the dimension' do
    dimension = [10, 10]
    cells = [Cell.live(5, 4)]
    universe = Universe.new(dimension, cells)
    expect(universe.cell_at(5, 4)).to be_a_kind_of(Cell)
  end

  it 'should not contain a cell in an unseeded position' do
    dimension = [10, 10]
    cells = [Cell.live(4, 4)]
    universe = Universe.new(dimension, cells)
    expect(universe.cell_at(5, 4)).to be(nil)
  end

  it 'should not contain a cell if the given location is beyond the dimension' do
    dimension = [10, 10]
    universe = Universe.new(dimension)
    expect(universe.cell_at(100, 100)).to be(nil)
  end

  it 'should be seedable with live cells in given dimensions' do
    dimension = [10, 10]
    living_cells = [Cell.live(1, 2), Cell.live(0, 5)]
    universe = Universe.new(dimension, living_cells)
    expect(universe.living_cells).to match_array(living_cells)
  end

  it 'should not be seeded with live cells which are beyond the dimnsions' do
    dimension = [10, 10]
    living_cells = [Cell.live(1, 2), Cell.live(100, 5)]
    universe = Universe.new(dimension, living_cells)
    expect(universe.living_cells).to match_array([Cell.live(1, 2)])
  end

end