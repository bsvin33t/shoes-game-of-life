require 'rspec'

describe Cell do

  it 'should expose its location' do
    location = [10, 10]
    cell = Cell.new(location)
    expect(cell.location).to eq(location)
  end

  describe 'equality' do
    it 'should compare if the class type and the location' do
      expect(Cell.new([10, 10])).to eq(Cell.new([10, 10]))
    end

    it 'should compare the object id' do
      cell = Cell.new([10, 10])
      expect(cell).to eq(cell)
    end
  end
end