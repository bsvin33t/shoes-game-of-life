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
end