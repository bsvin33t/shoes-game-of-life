require 'rspec'

describe Cell do

  it 'should expose its location' do
    cell = Cell.new(10, 10)
    expect(cell.location).to eq([10, 10])
  end

  describe 'equality' do
    it 'should compare if the class type and the location' do
      expect(Cell.new(10, 10)).to eq(Cell.new(10, 10))
    end

    it 'should compare the object id' do
      cell = Cell.new(10, 10)
      expect(cell).to eq(cell)
    end
  end

  describe 'increment neighbour' do
    it 'should incriment the number of neighbours to a cell' do
      cell = Cell.new(5, 10)
      cell.increment_neighbour
      expect(cell.neighbour_count).to eq(1)
    end
  end

  it 'should die in the next tick if neighbour population is zero' do
    cell = Cell.new(5, 10)
    expect(cell.alive_for_next_tick?).to eq(false)
  end

  it 'should die in the next tick if neighbour population is one' do
    cell = Cell.new(5, 10)
    1.times {cell.increment_neighbour}
    expect(cell.alive_for_next_tick?).to eq(false)
  end

  it 'should live in the next tick if the neighbour population is two' do
    cell = Cell.new(5, 10)
    2.times {cell.increment_neighbour}
    expect(cell.alive_for_next_tick?).to eq(true)
  end

  it 'should live in the next tick if the neighbour population is three' do
    cell = Cell.new(5, 10)
    3.times {cell.increment_neighbour}
    expect(cell.alive_for_next_tick?).to eq(true)
  end

  it 'should die in the next tick if neighbour population is four' do
    cell = Cell.new(5, 10)
    4.times {cell.increment_neighbour}
    expect(cell.alive_for_next_tick?).to eq(false)
  end

end