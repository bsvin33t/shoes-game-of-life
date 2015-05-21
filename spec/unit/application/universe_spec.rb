require 'rspec'

describe '2D Universe' do

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
    cells = [[5, 4]]
    universe = Universe.new(dimension, cells)
    expect(universe.cell_at(5, 4)).to be_a_kind_of(Cell)
  end

  it 'should not contain a cell in an unseeded position' do
    dimension = [10, 10]
    cells = [[4, 4]]
    universe = Universe.new(dimension, cells)
    expect(universe.cell_at(8, 8)).to be(nil)
  end

  it 'should not contain a cell if the given location is beyond the dimension' do
    dimension = [10, 10]
    universe = Universe.new(dimension)
    expect(universe.cell_at(100, 100)).to be(nil)
  end

  it 'should be seedable with live cells in given dimensions' do
    dimension = [10, 10]
    living_cells = [Cell.alive(1, 2), Cell.alive(0, 5)]
    living_cell_locations = [[1, 2], [0, 5]]
    universe = Universe.new(dimension, living_cell_locations)
    expect(universe.living_cells).to match_array(living_cells)
  end

  it 'should not be seeded with live cells which are beyond the dimnsions' do
    dimension = [10, 10]
    living_cell_locations = [[1, 2], [100, 5]]
    universe = Universe.new(dimension, living_cell_locations)
    expect(universe.living_cells).to match_array([Cell.alive(1, 2)])
  end

  context 'when seeding with live cells' do
    it 'should populate the neighbouring blocks of the live cells with 8 dead cells' do
      dimension = [10, 10]
      living_cells = [[1, 2]]
      universe = Universe.new(dimension, living_cells)
      expect(universe.cells.count).to eq(9)
    end

    it 'should populate the neighbouring blocks of the live cells with 5 dead cells' do
      dimension = [10, 10]
      living_cells = [[0, 1]]
      universe = Universe.new(dimension, living_cells)
      expect(universe.cells.count).to eq(6)
    end

    it 'should populate the neighbouring blocks of the live cells with 3 dead cells' do
      dimension = [10, 10]
      living_cells = [[0, 0]]
      universe = Universe.new(dimension, living_cells)
      expect(universe.cells.count).to eq(4)
    end

    it 'should populate the neighbouring blocks of the live cells with 3 dead cells' do
      dimension = [10, 10]
      living_cells = [[9, 9]]
      universe = Universe.new(dimension, living_cells)
      expect(universe.cells.count).to eq(4)
    end

    it 'should populate the neighbouring blocks of the live cells with 3 dead cells' do
      dimension = [10, 10]
      living_cells = [[0, 9]]
      universe = Universe.new(dimension, living_cells)
      expect(universe.cells.count).to eq(4)
    end

    it 'should populate the neighbouring blocks of the live cells with 3 dead cells' do
      dimension = [10, 10]
      living_cells = [[9, 0]]
      universe = Universe.new(dimension, living_cells)
      expect(universe.cells.count).to eq(4)
    end
  end

end