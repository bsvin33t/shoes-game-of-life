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

  it 'should be seedable with live cells in given dimensions' do
    dimension = [10, 10]
    living_cell_locations = [[1, 2], [0, 5]]
    universe = Universe.new(dimension, living_cell_locations)
    expect(universe.living_cells_locations).to match_array(living_cell_locations)
  end

  it 'should not be seeded with live cells which are beyond the dimnsions' do
    dimension = [10, 10]
    living_cell_locations = [[1, 2], [100, 5]]
    universe = Universe.new(dimension, living_cell_locations)
    expect(universe.living_cells_locations).to match_array([[1, 2]])
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

  context 'tick' do
    it 'changes the state of the cells in the universe' do
      dimension = [10, 10]
      live_cells = [[0, 0], [1, 0], [0, 1]]
      universe = Universe.new(dimension, live_cells)
      universe.tick
      expect(universe.living_cells_locations.count).to eq(4)
    end

    it 'changes the state of a single cell' do
      dimension = [10, 10]
      live_cells = [[0, 0]]
      universe = Universe.new(dimension, live_cells)
      universe.tick
      expect(universe.cells.count).to eq(4)
    end

    it 'changes the state of two cells in the universe' do
      dimension = [10, 10]
      live_cells = [[0, 0], [0, 1]]
      universe = Universe.new(dimension, live_cells)
      universe.tick
      expect(universe.cells.count).to eq(6)
    end
  end

  describe 'clear' do
    it 'should clear the universe from all cells' do
      dimension = [10, 10]
      live_cells = [[0, 0], [0, 1]]
      universe = Universe.new(dimension, live_cells)
      universe.clear
      expect(universe.cells.count).to eq(0)
    end
  end

end