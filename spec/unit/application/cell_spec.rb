require 'rspec'

describe Cell do

  it 'creates a cell which is alive' do
    cell = Cell.alive(10, 10)
    expect(cell.status).to eq(Cell::ALIVE)
  end

  it 'creates a cell which is dead' do
    cell = Cell.dead(10, 10)
    expect(cell.status).to eq(Cell::DEAD)
  end

  it 'changes the state of a dead cell to a live cell' do
    cell = Cell.dead(10, 10)
    cell.resurrect
    expect(cell).to eq(Cell.alive(10, 10))
  end

  it 'should expose its location' do
    cell = Cell.alive(10, 10)
    expect(cell.location).to eq([10, 10])
  end

  describe 'equality' do
    it 'should compare if the class type and the location' do
      expect(Cell.alive(10, 10)).to eq(Cell.alive(10, 10))
    end

    it 'should compare the object id' do
      cell = Cell.new(10, 10)
      expect(cell).to eq(cell)
    end

    it 'should compare the status for alive' do
      cell_1 = Cell.alive(10, 10)
      cell_2 = Cell.dead(10, 10)
      expect(cell_1).not_to eq(cell_2)
    end

    it 'should compare the status for dead' do
      cell_1 = Cell.dead(10, 10)
      cell_2 = Cell.dead(10, 10)
      expect(cell_1).to eq(cell_2)
    end

  end

  describe 'increment neighbour' do
    it 'should increment the number of neighbours to a cell' do
      cell = Cell.alive(5, 10)
      cell.increment_neighbour
      expect(cell.neighbour_count).to eq(1)
    end
  end

  it 'should die in the next tick if neighbour population is zero' do
    cell = Cell.alive(5, 10)
    expect(cell.tick).to eq(Cell.dead(5, 10))
  end

  it 'should die in the next tick if neighbour population is one' do
    cell = Cell.alive(5, 10)
    1.times { cell.increment_neighbour }
    expect(cell.tick).to eq(Cell.dead(5, 10))
  end

  it 'should live in the next tick if the neighbour population is two' do
    cell = Cell.alive(5, 10)
    2.times { cell.increment_neighbour }
    expect(cell.tick).to eq(Cell.alive(5, 10))
  end

  it 'should live in the next tick if the neighbour population is three' do
    cell = Cell.alive(5, 10)
    3.times { cell.increment_neighbour }
    expect(cell.tick).to eq(Cell.alive(5, 10))
  end

  it 'should die in the next tick if neighbour population is four' do
    cell = Cell.alive(5, 10)
    4.times { cell.increment_neighbour }
    expect(cell.tick).to eq(Cell.dead(5, 10))
  end

  it 'should become a live cell on the next tick if the neighbour population is excatly three' do
    cell = Cell.dead(5, 10)
    3.times { cell.increment_neighbour }
    expect(cell.tick).to eq(Cell.alive(5, 10))
  end

  it 'should let other systems know if it is alive' do
    cell = Cell.alive(5, 10)
    expect(cell).to be_alive
  end

end