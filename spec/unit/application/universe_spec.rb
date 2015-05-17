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
end